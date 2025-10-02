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





SELECT * FROM public.landmarks
ORDER BY id ASC 
select a.name as line_name,
	   b.name as polygon_name,
	   st_distance(st_transform(a.geom,32643),st_transform(b.geom,32643)) as distancin_m
	   from(select * from line_only order by id limit 2) a
	   cross join (select * from polygon_only order by id limit 2) b;


	   select id, st_astext(geom), osm_id,name,type,population from places
	   select st_astext(st_transform(geom,3678)) from places where population is not null


select id , st_astext(st_transform(geom,3678)),osm_id,name,ref,type,oneway,bridge,maxspeed from roads


select r.name from roads r join places p
 on st_dwithin(st_transform(r.geom,3678),st_transform(p.geom,3678),300) where p.population is not null and r.name is not null
