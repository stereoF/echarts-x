var echarts = require('echarts/lib/echarts');

var Grid3DModel = echarts.extendComponentModel({

    type: 'grid3D',

    dependencies: ['xAxis3D', 'yAxis3D', 'zAxis3D'],

    defaultOption: {

        zlevel: 10,

        // Layout used for viewport
        left: 0,
        top: 0,
        width: '100%',
        height: '100%',

        // Dimension of grid3D
        boxWidth: 100,
        boxHeight: 100,
        boxDepth: 100,

        light: {
            enable: false
        },

        viewControl: {

            // If rotate on on init
            autoRotate: false,

            // Start rotating after still for a given time
            // default is 3 seconds
            autoRotateAfterStill: 3,

            // Distance to the surface of globe.
            distance: 150,

            // Min distance to the surface of globe
            minDistance: 40,
            // Max distance to the surface of globe
            maxDistance: 400,

            // Position and quaternion of camera, override all other properties
            position: null,
            quaternion: null
        }
    }
});

module.exports = Grid3DModel;
