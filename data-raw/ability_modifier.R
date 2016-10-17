ability_modifier = data.frame(score = 1:30)
ability_modifier$modifier = floor((ability_modifier$score - 10)/2)

devtools::use_data(ability_modifier, overwrite=TRUE)
