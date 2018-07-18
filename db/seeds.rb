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
  a.max_qualityA = 6.5
	a.max_qualityB = 6.5
	a.max_qualityC = 6.5
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
  a.parameter_id = 1
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 105
	a.min_qualityB = 80
	a.min_qualityC = 75
	a.parameter_id = 2
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 1.05
	a.min_qualityB = 0.8
	a.min_qualityC = 0.75
	a.parameter_id = 3
end

Acceptance.create! do |a|
	a.max_qualityA = -1
	a.max_qualityB = -1
	a.max_qualityC = -1
	a.min_qualityA = 75
	a.min_qualityB = 65
	a.min_qualityC = -1
	a.parameter_id = 4
end

Acceptance.create! do |a|
	a.max_qualityA = 20
	a.max_qualityB = 30
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 5
end

Acceptance.create! do |a|
	a.max_qualityA = 8
	a.max_qualityB = 20
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 6
end

Acceptance.create! do |a|
	a.max_qualityA = 3
	a.max_qualityB = 15
	a.max_qualityC = -1
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 7
end

Acceptance.create! do |a|
	a.max_qualityA = 3
	a.max_qualityB = 5
	a.max_qualityC = 8
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 8
end

Acceptance.create! do |a|
	a.max_qualityA = 1
	a.max_qualityB = 4
	a.max_qualityC = 10
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 9
end

Acceptance.create! do |a|
	a.max_qualityA = 2.5
	a.max_qualityB = 3.5
	a.max_qualityC = 7
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 10
end

Acceptance.create! do |a|
	a.max_qualityA = 1
	a.max_qualityB = 1.5
	a.max_qualityC = 2
	a.min_qualityA = -1
	a.min_qualityB = -1
	a.min_qualityC = -1
	a.parameter_id = 11
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