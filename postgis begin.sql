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




SELECT * FROM public.landmarks
ORDER BY id ASC 
select st_astext(geom) as land from landmarks
select st_geometrytype(geom) from landmarks
select st_dimension(geom) from landmarks limit 2
select st_srid(geom) from landmarks

create table line_only(
id serial primary key,
name text not null,
category text,
geom geometry(linestring,4326)
);

create table polygon_only(
id serial primary key,
name text not null,
category text,
geom geometry(polygon,4326)
);

select id,name,category,st_astext(geom) from line_only
select id,name,category,st_astext(geom) from polygon_only

select st_length (geom) as length from line_only
select st_length(st_transform(geom,3857)) as length_meters from line_only
select st_srid (geom) from line_only

select st_area(geom) as area from polygon_only
select st_area(st_transform (geom,32643)) as area_inM2 from polygon_only
