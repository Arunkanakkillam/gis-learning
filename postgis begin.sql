SELECT * FROM public.landmarks
ORDER BY id ASC 


SELECT f_table_schema, f_table_name, f_geometry_column
FROM geometry_columns;
SELECT ST_SRID(geom) FROM landmarks;
SELECT ST_GeometryType(geom) FROM landmarks;
select ST_Area(geom) from landmarks

SELECT id, name, type, ST_AsText(geom) FROM landmarks;
select type,count(*) from landmarks group by type
select St_srid(geom) from landmarks

select l1.name as from_name,
	   l2.name as to_name,
st_distance(l1.geom::geography,l2.geom::geography) as distanc_meters
from 
landmarks l1,landmarks l2
where   l1.name = 'Fort Kochi Police Station'
  AND l2.name != 'Fort Kochi Police Station'
ORDER BY 
distanc_meters desc
limit 3


