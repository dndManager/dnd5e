#' Roll attack
#' 
#' Roll an attack
#' 
#' @param to_hit amount to add to the d20 attack roll
#' @param to_damage amount to add to the damage roll
#' @param type normal, advantage, or disadvantage
#' @param ... dice to roll, passed to \code{\link{roll_dice}}
#' @return attack and damage roll are printed
#' @export
#' 
roll_attack <- function(to_hit, to_damage, type="normal",...) {
  if (type == "normal")       attack_roll = sample(20, 1)
  if (type == "advantage")    attack_roll = max(sample(20, 2, replace=TRUE))
  if (type == "disadvantage") attack_roll = min(sample(20, 2, replace=TRUE))
  
  if (attack_roll == 1) {
    return(data.frame(
      type = "Critical miss!",
      attack_roll = 1,
      damage = 0)
    )
  }
  
  if (attack_roll == 20) {
    return(data.frame(
      type = "Critical hit!",
      attack_roll = 20+to_hit,
      damage = 
        roll_dice(..., collapse = TRUE)$result +
        roll_dice(..., collapse = TRUE)$result +
        to_damage)
    )
  }
  
  return(data.frame(
    type = "Normal",
    attack_roll = attack_roll+to_hit,
    damage = 
      roll_dice(..., collapse = TRUE)$result +
      to_damage)
  )
}