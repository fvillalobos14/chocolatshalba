User.create! do |u|
    u.email = 'warehouse'
    u.password = 'warehouse'
    u.warehouse_role = true
end

User.create! do |u|
    u.email = 'adminrole'
    u.password = 'adminrole'
    u.admin_role = true
end

User.create! do |u|
	u.email = 'qualitymanager'
	u.password = 'qualitymanager'
	u.quality_manager_role = true
end

User.create! do |u|
	u.email = 'certification'
	u.password = 'certification'
	u.certification_role = true
end

User.create! do |u|
	u.email = 'quality'
	u.password = 'quality'
	u.quality_role = true
end

User.create! do |u|
	u.email = 'administration'
	u.password = 'administration'
	u.administration_role = true
end

User.create! do |u|
	u.email = 'purchase'
	u.password = 'purchase'
	u.purchase_role = true
end

Organization.create! do |c|
	c.code = 'CCJ'
	c.name = 'COPRACAJUL'
end

Organization.create! do |c|
	c.code = 'CSV'
	c.name = 'COPROASERSO'
end

Organization.create! do |c|
	c.code = 'AMU'
	c.name = 'AMUCALAY'
end

Organization.create! do |c|
	c.code = 'APA'
	c.name = 'APACH'
end

Organization.create! do |c|
	c.code = 'AGS'
	c.name = 'APAGRISAC'
end

Organization.create! do |c|
	c.code = 'CCG'
	c.name = 'APROCAGUAL'
end

Organization.create! do |c|
	c.code = 'APB'
	c.name = 'ASOPROPIB'
end

Organization.create! do |c|
	c.code = 'APS'
	c.name = 'APROSACAO'
end

Organization.create! do |c|
	c.code = 'COA'
	c.name = 'COAGRICSAL'

end

Organization.create! do |c|
	c.code = 'COP'
	c.name = 'COAPANPAL'
end

Organization.create! do |c|
	c.code = 'CRA'
	c.name = 'CRASVIDMIL'
end

Organization.create! do |c|
	c.code = 'COV'
	c.name = 'COAVEL'
end

Organization.create! do |c|
	c.code = 'AFG'
	c.name = 'APROFIGUA'
end

Organization.create! do |c|
	c.code = 'SFE'
	c.name = 'SAN FERNANDO'
end

Organization.create! do |c|
	c.code = 'APP/FDL'
	c.name = 'APROCAPIM/FLOR DE LAURELES'
end

Organization.create! do |c|
	c.code = 'ASF'
	c.name = 'ASOPROSANFRA'
end


Organization.create! do |c|
	c.code = 'CCR'
	c.name = 'COPROCADER'
end


Organization.create! do |c|
	c.code = 'CPF'
	c.name = 'CAPROCAFIM'
end


Organization.create! do |c|
	c.code = 'APRO'
	c.name = 'APROCACAHO'
end


Organization.create! do |c|
	c.code = 'CLF'
	c.name = 'COOPERATIVA AGROPECUARIA LAS FLORES'
end

Organization.create! do |c|
    c.code = 'AGR'
    c.name = 'AGRONEGOCIOS FENIX'
end

Organization.create! do |c|
    c.code = 'IHF'
    c.name = 'INVERSIONES HALDAL FAJARDO'
end

Organization.create! do |c|
    c.code = 'CFM'
    c.name = 'CACAO FINO Y MADERABLES'
end

Organization.create! do |c|
    c.code = 'ANBM'
    c.name = 'ANA BELLA MACCHI'
end

Organization.create! do |c|
    c.code = 'BFPA'
    c.name = 'BENIGNO FERNANDEZ PAZ'
end

Organization.create! do |c|
    c.code = 'CATU'
    c.name = 'CARLOS TURCIOS'
end

Organization.create! do |c|
    c.code = 'ENRO'
    c.name = 'ENIO NOE RODRIGUEZ'
end

Organization.create! do |c|
    c.code = 'GMRO'
    c.name = 'GERARDO MANUEL ROMERO'
end

Organization.create! do |c|
    c.code = 'GEPA'
    c.name = 'GERARDO PALMA'
end

Organization.create! do |c|
    c.code = 'HENK'
    c.name = 'HENNING KRETSCHMER'
end
Organization.create! do |c|
    c.code = 'INME'
    c.name = 'INVERSIONES MELARA'
end
Organization.create! do |c|
    c.code = 'JOHH'
    c.name = 'JOHNNY HANDAL'
end
Organization.create! do |c|
    c.code = 'JORL'
    c.name = 'JORGE LANZA'
end
Organization.create! do |c|
    c.code = 'JVTO'
    c.name = 'JOSE VICENTE TORRES'
end

Organization.create! do |c|
    c.code = 'JAVI'
    c.name = 'JUAN ANGEL VIDES'
end
Organization.create! do |c|
    c.code = 'JCBE'
    c.name = 'JUAN CARLOS BENITEZ'
end
Organization.create! do |c|
    c.code = 'JCIC'
    c.name = 'JUAN CARLOS ICAZA'
end
Organization.create! do |c|
    c.code = 'JUMO'
    c.name = 'JUAN CARLOS ICAZA'
end
Organization.create! do |c|
	c.code = 'JUMA'
	c.name = 'JUBER MARTINEZ'
end

Organization.create! do |c|
	c.code = 'JDMU'
	c.name = 'JUSTINIANO DIAZ'
end
Organization.create! do |c|
	c.code = 'LEOB'
	c.name = 'LEONARDO BARAHONA'
end
Organization.create! do |c|
	c.code = 'MAXO'
	c.name = 'MAXIMILIANO ORTEGA'
end
Organization.create! do |c|
	c.code = 'MARE'
	c.name = 'MIGUEL ANGEL REYES'
end
Organization.create! do |c|
	c.code = 'NAPC'
	c.name = 'NAPOLEON CONTRERAS'
end
Organization.create! do |c|
	c.code = 'OLRA'
	c.name = 'OLMAN RAMOS'
end
Organization.create! do |c|
	c.code = 'OWHE'
	c.name = 'OSWALDO HERCULES'
end

Organization.create! do |c|
	c.code = 'PEBC'
	c.name = 'PULPERIA EL BUEN CAMINO'
end
Organization.create! do |c|
	c.code = 'ZUMM'
	c.name = 'WALTER ZUMMAR'
end
Organization.create! do |c|
 	c.code = 'CVCA'
 	c.name = 'CARLOS VIVIAN CALDERON'
end
Organization.create! do |c|
 	c.code = 'FLRO'
 	c.name = 'FINCA LA ROMA'
end
Organization.create! do |c|
 	c.code = 'ERBT'
 	c.name = 'ERICK BABIE THOMAS'
end
Organization.create! do |c|
 	c.code = 'CAVJ'
 	c.name = 'COMPAÑÍA AGRICOLA VILLA JULIA'
end
Organization.create! do |c|
 	c.code = 'EACB'
	c.name = 'EMPRESA ASOCIATIVA CAMPESINA BIENVENIDO'
end
Organization.create! do |c|
 	c.code = 'BDCA'
	c.name = 'BELLEZAS DEL CAMPO'
end
Organization.create! do |c|
	c.code = 'RDFA'
	c.name = 'RODOLFO FASQUELLE'
end
Organization.create! do |c|
	c.code = 'JACR'
	c.name = 'JOSE ANIBAL CALLEJAS'
end
Organization.create! do |c|
	c.code = 'JCGM'
	c.name = 'JUAN CARLOS GARCIA MUÑOZ'
end
Organization.create! do |c|
	c.code = 'NL'
	c.name = 'NEPTALI LOPEZ'
end
Organization.create! do |c|
	c.code = 'JRFM'
	c.name = 'JORGE ROBERTO FAJARDO MOREL'
end

CocoaType.create do |c|
	c.name = 'A'
end

CocoaType.create do |c|
	c.name = 'B'
end

CocoaType.create do |c|
	c.name = 'C'
end

CertificateType.create do |ct|
    ct.name= 'E'
end

CertificateType.create do |ct|
    ct.name= 'T'
end

CertificateType.create do |ct|
    ct.name= 'C'
end

GeneticMaterial.create do |g|
	g.name = 'HT'
end

GeneticMaterial.create do |g|
	g.name = 'IA'
end

Category.create do |c|
	c.name = 'Contenido de agua'
	c.place = 1
	c.runs = 1
	c.sensory = false
end

Category.create do |c|
	c.name = 'Peso de granos'
	c.place = 2
	c.runs = 1
	c.sensory = false
end

Category.create do |c|
	c.name = 'Prueba de corte'
	c.place = 3
	c.runs = 6
	c.sensory = false
end

Category.create do |c|
	c.name = 'Valores de referencia'
	c.place = 4
	c.runs = 1
	c.sensory = true
end

Parameter.create do |p|
	p.name = 'Humedad del grano'
	p.unit = '%'
	p.place = 1
	p.category_id = 1
end

Parameter.create do |p|
	p.name = 'Peso de 300 granos'
	p.unit = 'g'
	p.place = 1
	p.category_id = 2
end

Parameter.create do |p|
	p.name = 'Peso promedio por grano'
	p.unit = 'g'
	p.place = 2
	p.category_id = 2
end

Parameter.create do |p|
	p.name = 'Bien fermentados'
	p.unit = ''
	p.place = 1
	p.category_id = 3
end

Parameter.create do |p|
	p.name = 'Bien Ligeramente violetas'
	p.unit = ''
	p.place = 2
	p.category_id = 3
end

Parameter.create do |p|
	p.name = 'Violetas'
	p.unit = ''
	p.place = 3
	p.category_id = 3
end

Parameter.create do |p|
	p.name = 'Sobrefermentados'
	p.unit = ''
	p.place = 4
	p.category_id = 3
end

Parameter.create do |p|
	p.name = 'Moho interno'
	p.unit = ''
	p.place = 5
	p.category_id = 3
end

Parameter.create do |p|
	p.name = 'Pizarrosos'
	p.unit = ''
	p.place = 6
	p.category_id = 3
end

Parameter.create do |p|
	p.name = 'Daños por insectos'
	p.unit = ''
	p.place = 7
	p.category_id = 3
end

Parameter.create do |p|
	p.name = 'Gemelos, planos, germinados, quebrados y otros'
	p.unit = ''
	p.place = 8
	p.category_id = 3
end

Parameter.create do |p|
	p.name = 'Cacao'
	p.unit = ''
	p.place = 1
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Acidez'
	p.unit = ''
	p.place = 2
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Astringencia'
	p.unit = ''
	p.place = 3
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Amargor'
	p.unit = ''
	p.place = 4
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Afrutado'
	p.unit = ''
	p.place = 5
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Floral'
	p.unit = ''
	p.place = 6
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Nueces'
	p.unit = ''
	p.place = 7
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Panela malta'
	p.unit = ''
	p.place = 8
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Crudo'
	p.unit = ''
	p.place = 9
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Sobretostado'
	p.unit = ''
	p.place = 10
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Moho'
	p.unit = ''
	p.place = 11
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Tierra'
	p.unit = ''
	p.place = 12
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Ahumado'
	p.unit = ''
	p.place = 13
	p.category_id = 4
end

Parameter.create do |p|
	p.name = 'Otros'
	p.unit = ''
	p.place = 14
	p.category_id = 4
end

Acceptance.create! do |a|
  a.max_qualityA = 11
	a.max_qualityB = 11
	a.max_qualityC = 11
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
  a.parameter_id = 1
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	#aqui antes tenia 105 el minqualityA
	a.min_qualityA = 0
	a.min_qualityB = 0
	a.min_qualityC = 0
	a.parameter_id = 2
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 0
	a.min_qualityB = 0
	a.min_qualityC = 0
	a.parameter_id = 3
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 75
	a.min_qualityB = 64
	a.min_qualityC = -1
	a.parameter_id = 4
end

Acceptance.create! do |a|
	a.max_qualityA = 101
	a.max_qualityB = 101
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 5
end

Acceptance.create! do |a|
	a.max_qualityA = 101
	a.max_qualityB = 101
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 6
end

Acceptance.create! do |a|
	a.max_qualityA = 3
	a.max_qualityB = 6
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 7
end

Acceptance.create! do |a|
	a.max_qualityA = 3
	a.max_qualityB = 6
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 8
end

Acceptance.create! do |a|
	a.max_qualityA = 101
	a.max_qualityB = 101
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 9
end

Acceptance.create! do |a|
	a.max_qualityA = 2
	a.max_qualityB = 2
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 10
end

Acceptance.create! do |a|
	a.max_qualityA = 101
	a.max_qualityB = 101
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 11
end
#AGREGANDO CRITERIOS DE ACEPTACION
Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 5
	#este 0 se coloca para decirle al sistema, 
	# que este parametro no decide si pasa a calidad C
	a.min_qualityB = 0
	a.min_qualityC = -1
	a.parameter_id = 12
end

Acceptance.create! do |a|
	a.max_qualityA = 3
	# este 11 significa que este parametro
	# no decide si pasa a calidad C,
	#recordando que en este analisis el maximo valor es 10
	a.max_qualityB = 11
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 13
end

Acceptance.create! do |a|
	#este 11 lo coloco para que este parametro no baje la calidad
	# segun lo que dijeron en chocolatshalba, este parametro
	# no baja la calidad del cacao
	a.max_qualityA = 11
	a.max_qualityB = 11
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 14
end

Acceptance.create! do |a|
	a.max_qualityA = 11
	a.max_qualityB = 11
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 15
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 0
	a.min_qualityB = 0
	a.min_qualityC = -1
	a.parameter_id = 16
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 0
	a.min_qualityB = 0
	a.min_qualityC = -1
	a.parameter_id = 17
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 0
	a.min_qualityB = 0
	a.min_qualityC = -1
	a.parameter_id = 18
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 0
	a.min_qualityB = 0
	a.min_qualityC = -1
	a.parameter_id = 19
end

Acceptance.create! do |a|
	a.max_qualityA = 11
	a.max_qualityB = 11
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 20
end

Acceptance.create! do |a|
	a.max_qualityA = 11
	a.max_qualityB = 11
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 21
end

Acceptance.create! do |a|
	a.max_qualityA = 1
	a.max_qualityB = 11
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 22
end

Acceptance.create! do |a|
	a.max_qualityA = 1
	a.max_qualityB = 11
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 23
end

Acceptance.create! do |a|
	a.max_qualityA = 1
	a.max_qualityB = 1
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 24
end

Acceptance.create! do |a|
	a.max_qualityA = 1
	a.max_qualityB = 1
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 25
end

Price.create! do |p|
	p.price = 3000
	p.cocoa_type_id = 1
end

Price.create! do |p|
	p.price = 2000
	p.cocoa_type_id = 2
end

Price.create! do |p|
	p.price = 1000
	p.cocoa_type_id = 3
end

Archive.create! do |a|
  a.title = "Hoja de remisión de la cooperativa"
end
Archive.create! do |a|
  a.title = "Listado de productores"
end
Archive.create! do |a|
  a.title = "Hoja de inspección y limpieza del vehiculo de transporte"
end
Archive.create! do |a|
  a.title = "Hoja de limpieza del centro de acopio"
end
Archive.create! do |a|
  a.title = "Hoja de constancia de envasado del cacao"
end
Archive.create! do |a|
  a.title = "Factura de venta"
end
