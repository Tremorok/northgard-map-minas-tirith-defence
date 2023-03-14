{
	"s3d": {
		"Renderer": {
			"Shaders": {
				"water": {
					"Composite": {
						"fresnelPower": 0.3125,
						"refractAmount": 0.895,
						"waterAlpha": 0.775,
						"refractTurbulence": 0.0375,
						"reflectAmount": 0.5475
					},
					"Color": {
						"color": "#FF6990C6"
					},
					"shader shaders Wave": {
						"turbulence": 0.03
					}
				},
				"ambient": {
					"shader shaders Composite": {
						"fogColor": "#CEE0F0",
						"bloomPower": 10,
						"shadowIntensity" : 1.0
					}
				}
			},
			"Lights": {
				"Shadows": {
					"color": "#939AB8"
				},
				"LightSystem": {
					"ambientLight": "#A2ABB0"
				},
				"DirLight": {
					"Light": {
						"color": "#798087"
					}
				}
			}
		}
	}
}