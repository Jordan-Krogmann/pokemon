create_model_work_flow_func <- function(
  data = NULL,
  ...
){
  
  # ----- load packages -----
  library(magrittr)
  
  df <- data
  
  # ----- create model recipe ----- 
  mod_rec <- recipes::recipe(
    is_legendary ~.,
    data = df
  ) %>% 
    recipes::update_role(studentid, new_role = "ID") %>% 
    recipes::step_dummy(all_predictors(), -all_numeric())
  
  # ----- create model specification ----- 
  mod_spec <- parsnip::logistic_reg() %>% 
    parsnip::set_mode(mode = "classification") %>% 
    parsnip::set_engine("glm")
  
  # ----- create model workflow ----- 
  mod_flow <- workflows::workflow() %>%
    workflows::add_recipe(mod_rec) %>% 
    workflows::add_model(mod_spec)
  
  return(mod_flow)
  
}