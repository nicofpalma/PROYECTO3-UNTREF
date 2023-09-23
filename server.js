const express = require('express');
const app = express();

const sequelize = require('./src/config/config');
const Trailer = require('./src/models/trailers');
const { Op } = require('sequelize');
const port = process.env.PORT || 3000;

app.use(express.json());
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

// Muestra todos los trailers existentes, con toda su información.
app.get('/catalogo', async (req, res) => {
    try {
        const allTrailers = await Trailer.findAll();

        allTrailers.length !== 0
            ? res.status(200).json({
                response: allTrailers,
                success: true,
                msg: "Todos los trailers encontrados con éxito"
            })
            : res.status(404).json({
                response: [],
                success: false,
                msg: 'No se encontraron trailers'
            });
    } catch (error) {
        res.status(500).json({
            error: 'Error al intentar recuperar los trailers',
            success: false,
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

// Encontrar un trailer bajo cierto ID
app.get('/catalogo/id/:id', async(req, res) => {
    try {
        const trailerId = req.params.id;
        
        // Control de ID numerico
        if(isNaN(trailerId)){
            return res.status(400).json({
                error: 'El parámetro "id" debe ser numérico',
                success: false,
                msg: 'Por favor, proporcione un valor numérico válido para encontrar un trailer por ID'
            });
        };

        // Control de ID valido
        if(trailerId <= 0){
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

// Buscar por parte del nombre, substring es equivalente a %LIKE%.
app.get('/catalogo/nombre/:nombre', async(req, res) => {
    try {
        const trailerName = req.params.nombre;

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

// Encontrar trailers con cierto genero
app.get('/catalogo/genero/:genero', async(req, res) => {
    try {
        const trailerGenre = req.params.genero;

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

// Encontrar trailers bajo cierta categoria
app.get('/catalogo/categoria/:categoria', async(req, res) => {
    try {
        const trailerCategory = req.params.categoria;

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

// Muestra todas las categorias existentes
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
                success: false,
                response: [],
                msg: 'No se encontraron categorías'
            });
    } catch (error){
        res.status(500).json({
            success: false,
            error: 'Error al intentar recuperar las categorias',
            msg: 'Mensaje de error: ' + error.message
        });
    };
});

// Control de rutas inexistentes
app.get('*', async(req, res) => {
    res.status(404).json({
        success: false,
        error: 'Ruta invalida',
        msg: 'Corrobore estar ingresando a la ruta correcta'
    });
});

app.listen(port, () => console.log(`Servidor escuchando en el puerto ${port}`));
