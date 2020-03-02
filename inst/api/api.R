data(fopi, package = "fopi")

#* Year
#* 
#* Get Freedom of Press Index for a specific year.
#* 
#* @param year Year of Index.
#* 
#* @serializer unboxedJSON
#* @get /year
function(res, year){
  if(missing(year)){
    res$status <- 400
    return(list(error = "Missing year parameter."))
  }

  fopi[fopi$year == year,]
}

#* Country
#* 
#* Get Freedom of Press Index for a specific country.
#* 
#* @param country Country of Index.
#* 
#* @serializer unboxedJSON
#* @get /country
function(res, country){
  if(missing(country)){
    res$status <- 400
    return(list(error = "Missing country parameter."))
  }

  fopi[fopi$country == country,]
}

#* Rank
#* 
#* Get a Freedom of Press Index rank year by year.
#* 
#* @param rank Rank of Index.
#* 
#* @serializer unboxedJSON
#* @get /rank
function(res, rank){
  if(missing(rank)){
    res$status <- 400
    return(list(error = "Missing rank parameter."))
  }

  fopi[fopi$rank == rank,]
}
