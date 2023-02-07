/* Habrá que generar una consulta sql para sacar el siguiente listado de coches activos
que hay en keepcoding:

- Nombre modelo, marca y grupo de coches (los nombre de todos)
- Fecha de compra
- Matricula
- Nombre del color del coche
- total kilometros
- Nombre empresa que está asegurado el coche
- Número de póliza

*/

select c.idcoche, c.matricula ,m.nombremodelo, m2.nombremarca, g.nombregrupo, c.fechacompra ,c.matricula , c2.nombre_color, c.kilometros, p.nro_poliza, a.nombre_aseguradora  
from alexmaster.coches c inner join alexmaster.modelos m on c.idmodelo  = m.idmodelo  
inner join alexmaster.marcas m2 on m2.idmarca = m.idmarca 
inner join alexmaster.grupoempresarial g on g.idgrupoempresarial = m2.idgrupoempresarial 
inner join alexmaster.colores c2 on c2.idcolor = c.idcolor 
inner join alexmaster.polizas p on p.idpoliza = c.idpoliza 
inner join alexmaster.aseguradoras a on a.idaseguradora = p.idaseguradora 
where c.estado = '1' ; --El estado 1 es activo
