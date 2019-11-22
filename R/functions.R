
string_thing <- "maybe"

tmp_l <- list("no","yes")


# grabs all the pngs from a web pagr
scrape_all_pngs <- function(input_string, input_list){
  
  # loop of names
  for (i in input_list){
    print(
      sprintf("input_string/%s", i)      
    )
  }
}




scrape_all_pngs(input_string = string_thing, input_list = tmp_l)

