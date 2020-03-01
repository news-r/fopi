library(fopi)

#* Year
#* 
#* Get Freedom of Press Index for a specific year
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
#* Get Freedom of Press Index for a specific country
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
