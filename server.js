/**
 * Módulo principal de la aplicación.
 * @module server
 */

/**
 * Import de Express.
 * @const {object}
 */
const express = require('express');

/**
 * La aplicación Express.
 * @type {object}
 */
const app = express();

/**
 * Import del archivo de configuracion para sequelize (config.js).
 * @const {object}
 */
const sequelize = require('./src/config/config');

/**
 * Import del archivo del modelo de la vista SQL que contiene toda la información de los trailers, con todos sus campos, tal como está en el JSON de trailerflix.
 * @const {object}
 */
const Trailer = require('./src/models/trailers');

/**
 * Objeto que contiene los operadores de sequalize y los deja listos para uso.
 * @type {object}
 */
const { Op } = require('sequelize');

/**
 * El puerto en el que se ejecuta la aplicación importado desde el archivo .env.
 * @const {number}
 */
const port = process.env.PORT || 3000;

/**
 * Middleware para analizar las solicitudes JSON.
 */
app.use(express.json());

/**
 * Middleware para establecer el encabezado Content-Type en las respuestas.
 * @param {Request} req - El objeto de solicitud.
 * @param {Response} res - El objeto de respuesta.
 * @param {function} next - La función para pasar al siguiente middleware.
 */
app.use((req, res, next) => {
    res.header('Content-Type', 'application/json; charset=utf-8');
    next();
});

/**
 * Middleware para conectar con la base de datos MySQL y sincronizar el modelo Trailer.
 *
 * @param {object} req - El objeto de solicitud.
 * @param {object} res - El objeto de respuesta.
 * @param {function} next - Función para pasar al siguiente middleware.
 */
app.use(async (req, res, next) => {
    try {
        await sequelize.authenticate();
        await Trailer.sync();
        next();
    } catch (error) {
        res.status(500).json({
            error: 'Error al conectar con la base de datos MySQL',
            success: false,
            msg: 'Mensaje de error: ' + error.message
        });
    }
});

/**
 * Ruta para obtener todos los trailers existentes en la base de datos.
 *
 * @route GET /catalogo
 * @desc Obtiene todos los trailers existentes, con toda su información.
 *
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 * 
 * @returns {JSON} Lista de trailers, con toda su información, un booleano indicando el éxito de la ejecución y un mensaje que indica si se pudo encontrar algún trailer o no.
 * @throws {Error} Error al intentar recuperar los trailers.
 */
app.get('/catalogo', async (req, res) => {
    try {
        const allTrailers = await Trailer.findAll();

        if (allTrailers.length !== 0) {
            // Agrego el path absoluto al poster, lo ejemplifico como si estuviesen en el directorio "images"
            const trailersConRutaPoster = allTrailers.map(trailer => {
                trailer.poster = __dirname + "/images" + trailer.poster
                return trailer;
            });

            res.status(200).json({
                response: trailersConRutaPoster,
                success: true,
                msg: "Todos los trailers encontrados con éxito"
            });
        } else {
            res.status(404).json({
                response: [],
                success: false,
                msg: 'No se encontraron trailers'
            });
        }
    } catch (error) {
        res.status(500).json({
            error: 'Error al intentar recuperar los trailers',
            success: false,
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

/**
 * Ruta para encontrar un trailer por ID.
 *
 * @route GET /catalogo/id/:id
 * @desc Busca y devuelve un trailer de la base de datos, que se busca por el ID que se pasa en el path.
 *
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @param {number} id ID del trailer a buscar.
 *
 * @returns {JSON} Trailer encontrado, o un mensaje de error si no se encuentra.
 *
 * @throws {Error} Error al intentar recuperar los trailers por ID.
 */
app.get('/catalogo/id/:id', async (req, res) => {
    try {
        const trailerId = req.params.id;

        // Control de ID numerico
        if (isNaN(trailerId)) {
            return res.status(400).json({
                error: 'El parámetro "id" debe ser numérico',
                success: false,
                msg: 'Por favor, proporcione un valor numérico válido para encontrar un trailer por ID'
            });
        };

        // Control de ID valido
        if (trailerId <= 0) {
            return res.status(400).json({
                error: 'El parámetro "id" debe ser mayor a 0',
                success: false,
                msg: 'Por favor, proporcione un valor numérico mayor a 0 para encontrar un trailer por ID'
            });
        };

        const trailer = await Trailer.findByPk(trailerId);

        !trailer
            ? res.status(404).json({
                response: [],
                success: false,
                msg: `No se encontró el trailer con ID ${trailerId}`
            })
            : res.status(200).json({
                response: trailer,
                success: true,
                msg: `Trailer con ID ${trailerId} encontrado con éxito`
            });
    } catch (error) {
        res.status(500).json({
            error: 'Error al intentar recuperar los trailers por ID',
            success: false,
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

/**
 * Ruta para buscar trailers por parte del nombre.
 *
 * @route GET /catalogo/nombre/:nombre
 * @desc Busca los trailers que coincidan con el nombre (título del trailer) que se provee en el path, la consulta es equivalente a LIKE = %nombre% en SQL (se puede buscar por parte del nombre).
 * 
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @param {string} nombre Nombre del trailer a buscar.
 *
 * @returns {JSON} Lista de trailers que coinciden con el nombre, o un mensaje de error si no se encuentran.
 *
 * @throws {Error} Error al intentar recuperar los trailers por nombre.
 */
app.get('/catalogo/nombre/:nombre', async (req, res) => {
    try {
        const trailerName = req.params.nombre.trim();

        if(trailerName === ''){
            return res.status(404).json({
                error: "No puede dejar vacío el campo nombre",
                success: false,
                msg: "Verifique de estar pasando el nombre correctamente y vuelva a intentarlo"
            });
        };

        const trailers = await Trailer.findAll({
            where: {
                titulo: {
                    [Op.substring]: trailerName
                }
            }
        });

        trailers.length !== 0
            ? res.status(200).json({
                response: trailers,
                success: true,
                msg: `${trailers.length} trailers encontrados con éxito`
            })
            : res.status(404).json({
                response: [],
                success: false,
                msg: `No se encontraron trailers bajo el nombre "${trailerName}"`
            });

    } catch (error) {
        res.status(500).json({
            error: 'Error al intentar recuperar los trailers por nombre',
            success: false,
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

/**
 * Ruta para encontrar trailers con cierto genero.
 *
 * @route GET /catalogo/genero/:genero
 * @desc Busca y devuelve los trailers de la base de datos que coincidan con el género que se envía en el path.
 * 
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @param {string} genero Género de los trailers a buscar.
 *
 * @returns {JSON} Lista de trailers que coinciden con el genero, o un mensaje de error si no se encuentran.
 *
 * @throws {Error} Error al intentar recuperar los trailers por genero.
 */
app.get('/catalogo/genero/:genero', async (req, res) => {
    try {
        const trailerGenre = req.params.genero.trim();

        if(trailerGenre === ''){
            return res.status(404).json({
                error: "No puede dejar vacío el campo genero",
                success: false,
                msg: "Verifique de estar pasando el genero correctamente y vuelva a intentarlo"
            });
        };

        const trailers = await Trailer.findAll({
            where: {
                generos: {
                    [Op.substring]: trailerGenre
                }
            }
        });

        trailers.length !== 0
            ? res.status(200).json({
                response: trailers,
                success: true,
                msg: `${trailers.length} trailers encontrados con éxito bajo el género ${trailerGenre}`
            })
            : res.status(404).json({
                response: [],
                success: false,
                msg: `No se encontraron trailers bajo el género "${trailerGenre}"`
            });
    } catch (error) {
        res.status(500).json({
            error: 'Error al intentar recuperar los trailers por genero',
            success: false,
            msg: 'Mensaje de error: ' + error.message
        });
    }
});

/**
 * Ruta para encontrar trailers bajo cierta categoria.
 *
 * @route GET /catalogo/categoria/:categoria
 * @desc Busca y devuelve los trailers que coincidan con la categoria que se envía en el path. La coincidencia de nombre de la categoría debe ser exacta.
 * 
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @param {string} categoria Categoría de los trailers a buscar.
 *
 * @returns {JSON} Lista de trailers que coinciden con la categoria, o un mensaje de error si no se encuentran.
 *
 * @throws {Error} Error al intentar recuperar los trailers por categoria.
 */
app.get('/catalogo/categoria/:categoria', async (req, res) => {
    try {
        const trailerCategory = req.params.categoria.trim();

        if(trailerCategory === ''){
            return res.status(404).json({
                error: "No puede dejar vacío el campo categoria",
                success: false,
                msg: "Verifique de estar pasando la categoría correctamente y vuelva a intentarlo"
            });
        };

        const trailers = await Trailer.findAll({
            where: {
                categoria: trailerCategory
            }
        });

        trailers.length !== 0
            ? res.status(200).json({
                response: trailers,
                success: true,
                msg: `${trailers.length} trailers encontrados con éxito bajo la categoría ${trailerCategory}`
            })
            : res.status(404).json({
                response: [],
                success: false,
                msg: `No se encontraron trailers bajo la categoría "${trailerCategory}"`
            });
    } catch (error) {
        res.status(500).json({
            error: 'Error al intentar recuperar los trailers por categoria',
            success: false,
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

/**
 * Ruta para mostrar los trailers asociados al nombre del actor.
 *
 * @route GET /catalogo/reparto/:actor
 * @desc Busca y devuelve los trailers que coincidan con el nombre del actor que se envía en el path. Es decir, devuelve todos los trailers en donde ese actor participó en específico.
 * 
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @param {string} actor Nombre del actor del que se quieren buscar los trailers.
 *
 * @returns {JSON} Lista de trailers que coinciden con el actor, o un mensaje de error si no se encuentran.
 *
 * @throws {Error} Error al intentar recuperar los trailers por actor.
 */
app.get('/catalogo/reparto/:actor', async (req, res) => {
    try {
        const actor = req.params.actor.trim();

        if(actor === ''){
            return res.status(404).json({
                error: "No puede dejar vacío el campo actor",
                success: false,
                msg: "Verifique de estar pasando el actor correctamente y vuelva a intentarlo"
            });
        };

        const trailers = await Trailer.findAll({
            where: {
                reparto: {
                    [Op.substring]: actor
                }
            }
        });

        trailers.length !== 0
            ? res.status(200).json({
                response: trailers,
                success: true,
                msg: `${trailers.length} trailers encontrados con éxito donde participa el actor "${actor}`
            })
            : res.status(404).json({
                response: [],
                success: false,
                msg: `No se encontró ningún trailer en donde participa "${actor}"`
            });
    } catch (error) {
        res.status(500).json({
            error: 'Error al intentar los trailers por actor',
            success: false,
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

/**
 * Ruta para mostrar todas las categorias existentes.
 *
 * @route GET /categorias
 * @desc Busca y devuelve todas las categorías existentes en todos los trailers.
 *
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @returns {JSON} Lista de categorias, o un mensaje de error si no se encuentran.
 *
 * @throws {Error} Error al intentar recuperar las categorias.
 */
app.get('/categorias', async (req, res) => {
    try {
        const allCategories = await Trailer.findAll({
            attributes: ['categoria'],
            group: ['categoria']
        });

        allCategories.length !== 0
            ? res.status(200).json({
                success: true,
                response: allCategories,
                msg: 'Todas las categorías encontradas con éxito'
            })
            : res.status(404).json({
                response: [],
                success: false,
                msg: 'No se encontraron categorías'
            });
    } catch (error) {
        res.status(500).json({
            success: false,
            error: 'Error al intentar recuperar las categorias',
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

/**
 * Ruta para mostrar todos los géneros existentes.
 *
 * @route GET /generos
 * @desc Busca y devuelve todos los géneros existentes en todos los trailers de la base de datos.
 * 
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @returns {JSON} Lista de géneros, o un mensaje de error si no se encuentran.
 *
 * @throws {Error} Error al intentar recuperar los géneros.
 */
app.get('/generos', async (req, res) => {
    try {
        const allGenres = await Trailer.findAll({
            attributes: ['generos'],
            group: ['generos']
        });

        if (allGenres.length !== 0) {
            // Manejo de la data para mostrarla de una mejor manera, ya que la query devolvería algunos repetidos.
            const parsedGenres = allGenres.map(genero => genero.generos.split(', ')).flat();
            const uniqueGenres = [... new Set(parsedGenres)];
            const genresResponse = uniqueGenres.map(genero => ({
                "genero": genero
            }));

            res.status(200).json({
                success: true,
                response: genresResponse,
                msg: 'Todos los géneros encontrados con éxito'
            });
        } else {
            res.status(404).json({
                response: [],
                success: false,
                msg: 'No se encontraron géneros'
            });
        };
    } catch (error) {
        res.status(500).json({
            success: false,
            error: 'Error al intentar recuperar los géneros',
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

/**
 * Ruta principal o home.
 *
 * @route GET /
 * @desc Devuelve un json con todos los endpoints disponibles a lo largo de la aplicación.
 * 
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @returns {JSON} Lista de endpoints y su explicación breve.
 */
app.get('/', async(req, res) => {
    res.status(200).json({
        response: [
            {
                "/catalogo": {
                    url: req.get('host') + "/catalogo",
                    description: "Ruta para obtener todos los trailers existentes en la base de datos.",
                    parameters: "No necesita ningún parametro"
                }
            },
            {
                "/catalogo/id/:id": {
                    url: req.get('host') + "/catalogo/id/:id",
                    description: "Ruta para encontrar un trailer por ID.",
                    parameters: ":id => El ID del trailer a buscar"
                }
            },
            {
                "/catalogo/nombre/:nombre": {
                    url: req.get('host') + "/catalogo/nombre/:nombre",
                    description: "Ruta para buscar trailers por parte del nombre.",
                    parameters: ":nombre => El nombre del trailer o los trailers a buscar"
                }
            },
            {
                "/catalogo/genero/:genero": {
                    url: req.get('host') + "/catalogo/genero/:genero",
                    description: "Ruta para encontrar trailers con cierto genero.",
                    parameters: ":genero => El genero de los trailers a buscar"
                }
            }, 
            {
                "/catalogo/categoria/:categoria": {
                    url: req.get('host') + "/catalogo/categoria/:categoria",
                    description: "Ruta para encontrar trailers bajo cierta categoria.",
                    parameters: ":categoria => Categoría de los trailers a buscar"
                }
            },
            {
                "/catalogo/reparto/:actor": {
                    url: req.get('host') + "/catalogo/reparto/:actor",
                    description: "Ruta para mostrar los trailers asociados al nombre del actor",
                    parameters: ":actor => Nombre del actor del que se quieren buscar los trailers"
                }
            },
            {
                "/categorias": {
                    url: req.get('host') + "/categorias",
                    description: "Ruta para mostrar todas las categorias existentes",
                    parameters: "No necesita ningún parámetro"
                }
            },
            {
                "/generos": {
                    url: req.get('host') + "/generos",
                    description: "Ruta para mostrar todos los géneros existentes",
                    parameters: "No necesita ningún parámetro"
                }
            }
        ],
        explanation: "Estas son todas las rutas definidas a lo largo de toda la aplicación Node"
    });
});

/**
 * Control de rutas inexistentes.
 *
 * @route *
 * @desc Devuelve un mensaje de error cuando se solicita alguna ruta que no está definida.
 * 
 * @param {Request} req Objeto de solicitud.
 * @param {Response} res Objeto de respuesta.
 *
 * @returns {JSON} Mensaje de error cuando la ruta no existe.
 */
app.get('*', async (req, res) => {
    res.status(404).json({
        success: false,
        error: 'Ruta invalida',
        msg: 'Corrobore estar ingresando a la ruta correcta'
    });
});


/**
 * Inicia el servidor y escucha en el puerto especificado.
 */
app.listen(port, () => console.log(`Servidor escuchando en el puerto ${port}`));
