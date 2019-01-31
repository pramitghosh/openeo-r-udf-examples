#!/bin/bash
rscript=$1
results=$2
host=$3
port=$4
user=$5
password=$6
maxtests=$7

#install Littler
#sudo apt install r-cran-littler

r -pe "library(openeo)
	con = connect(host = '$host:$port', user = '$user', password = '$password')
	con %>% listProcesses()

	con %>% uploadUserData(content = '$rscript', target = '/udf/script.R')
	con %>% listFiles()
	pgb = con %>% pgb()

	graph = pgb\$collection\$sentinel2_subset %>%
	  pgb\$filter_daterange(extent = c('2017-05-01', '2017-05-31')) %>%
	  pgb\$apply_pixel(script = '/udf/script.R')

	for(i in 1:$maxtests)
	{
		cat(paste(Sys.time(), ': Started test #', i, '/$maxtests for file: $rscript\n================================================================================\n', sep = ''))
		t_start = Sys.time()
		con %>% preview(format='GTiff', task = graph, output_file = '$results')
		duration = difftime(Sys.time(), t_start, units = 's')
		cat(paste('Completed test #', i, '. ', sep = ''))
		print(duration)
	}"

