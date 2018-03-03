#' Roll NPC
#' 
#' Create a full-featured NPC
#' 
#' @export
#' @return a data.frame containing details about an NPC including 
#' appearance, abilities, talent, mannerism, interaction trait, ideal,
#' bond, and flaw or secret.
#' 
roll_npc <- function() {
  rbind(
    roll_npc_appearance(),
    roll_npc_abilities(),
    roll_npc_talent(),
    roll_npc_mannerism(),
    roll_npc_interaction_trait(),
    roll_npc_ideal(),
    roll_npc_bond(),
    roll_npc_flaw_or_secret()
  )
}

#' NPC Appearance
#' 
#' Create distinctive features for an NPC
#' 
#' @export
#' @return a generic distinctive feature
#' 
roll_npc_appearance <- function() {
  data.frame(
    feature = "appearance",
    result = sample(c(
      "distinctive jewelry: earrings, necklace, circlet, bracelets",
      "piercings",
      "flamboyant or outlandish clothes",
      "formal, clean clothes",
      "ragged, dirty clothes",
      "pronounced scar",
      "missing teeth",
      "missing fingers",
      "unusual eye color (or two different colors)",
      "tattoos",
      "birthmark",
      "unusual skin color",
      "bald",
      "braided beard or hair",
      "unusual hair color",
      "nervous eye twitch",
      "distinctive nose",
      "distinctive posture (crooked or rigid)",
      "exceptionally beautiful",
      "exceptionally ugly"),
      1))
}


#' NPC Abilities
#' 
#' Random high and low abilities
#' 
#' @export
#' @return a data.frame containing the high and low abilities
#' 
roll_npc_abilities <- function() {
  data.frame(
    feature = c("high ability","low ability"),
    result = c(
      sample(c(
        "strength - powerful, brawny, strong as an ox",
        "dexterity - lithe, agile, graceful",
        "constitution - hardy, hale, healthy",
        "intelligence - studious, learned, inquisitive",
        "wisdom - perspective, spiritual, insightful",
        "charisma - persuasive, forceful, born leader"),
        1),
      sample(c(
        "strength - feeble, scrawny",
        "dexterity - clumsy, fumbling",
        "constitution - sickly, pale",
        "intelligence - dim-witted, slow",
        "wisdom - oblivious, absentminded",
        "charisma - dull, boring"),
        1)
    )
  )
}

#' NPC Talent
#' 
#' Roll NPC talent
#' 
#' @export
#' @return data.frame with an NPC talent
#' 
roll_npc_talent <- function() {
  data.frame(
    feature = "talent",
    result = sample(c(
      "plays a musical instrument",
      "speaks several languages fluently",
      "unbelievably lucky",
      "perfect memory",
      "great with animals",
      "great with children",
      "great at solving puzzles",
      "great at one game",
      "great at impersonations",
      "draws beautifully",
      "paints beautifully",
      "sings beautifully",
      "drinks everyone under the table",
      "expert carpenter",
      "expert cook",
      "expert dart thrower and rock skipper",
      "expert juggler",
      "skilled actor and master of disguise",
      "skilled dancer",
      "knows thieves' cant"),
      1
    )
  )
}


#' NPC Mannerism
#' 
#' Random NPC mannerism
#' 
#' @export
#' @return a data.frame with with an NPC mannerism
#' 
roll_npc_mannerism <- function() {
  data.frame(
    feature = "mannerism",
    result = sample(c(
      "prone to singing, whistling, or humming quietly",
      "speaks in rhyme or some other peculiar way",
      "particularly low or high voice",
      "slurs words, lisps, or stutters",
      "enunciates overly clearly",
      "speaks loudly",
      "whispers",
      "uses flowery speech or long woods",
      "frequently uses the wrong word",
      "uses colorful oaths and exclamations",
      "makes constant jokes or puns",
      "prone to predictions of doom",
      "fidgets",
      "squints",
      "stares in the distance",
      "chews something",
      "paces",
      "taps fingers",
      "bites fingernails",
      "twirls hair or tugs beard"
    ),
    1
    )
  )
}


#' NPC Interaction trait
#' 
#' Random npc interaction trait
#' 
#' @export
#' @return a data.frame with an interaction trait
#' 
roll_npc_interaction_trait <- function() {
  data.frame(
    feature = "interaction trait",
    result = sample(c(
      "argumentative",
      "arrogant",
      "blustering",
      "rude",
      "curious",
      "friendly",
      "honest",
      "hot tempered",
      "irritable",
      "ponderous",
      "quiet",
      "suspicious"
    ),
    1))
}



#' NPC Ideal
#' 
#' Random NPC alignment and ideal
#' 
#' @export
#' @return a data.frame with an NPC ideal
#' 
roll_npc_ideal <- function() {
  data.frame(
    feature = c("alignment", "ideal"),
    result = c(sample(
      c("good","lawful","neutral","evil","chaotic"),
      1),
      sample(c(
        "beauty", "charity","greater good","life","respect","self-sacrifice",
        "community","fairness","honor","logic","responsibility","tradition",
        "balance","knowledge","live and let live","moderation","neutrality","people",
        "domination","greed","might","pain","retribution","slaughter",
        "change","creativity","freedom","independence","no limits","whimsy",
        "aspiration","discovery","glory","nation","redemption","self-knowledge")
        ,1)
    )
  )
}


#' NPC Bond
#' 
#' Random NPC bond
#' 
#' @export
#' @return data.frame with an npc bond
#' 
roll_npc_bond <- function() {
  data.frame(
    feature = "bond",
    result = sample(c(
      "dedicated to fulfilling a personal life goal",
      "protective of close family members",
      "protective of colleagues or compatriots",
      "loyal to a benefactor, patron, or employer",
      "captivated by a romantic interest",
      "drawn to a special place",
      "protective of a sentimental keepsake",
      "protective of a valuable possession",
      "out for revenge"
    ), 1)
  )
}


#' NPC flaw or secret
#' 
#' Random NPC flaw or secret
#' 
#' @export
#' @return a data.frame with a random flaw or secret
#' 
roll_npc_flaw_or_secret <- function() {
  data.frame(
    feature = "flaw or secret",
    result = sample(c(
      "forbidden love or susceptibility to romance",
      "enjoys decadent pleasures",
      "arrogance",
      "envies another creature's possessions or station",
      "overpowering greed",
      "prone to rage",
      "has a powerful enemy",
      "specific phobia",
      "shameful or scandalous history",
      "secret crime or misdeed",
      "possession of forbidden lore",
      "follhardy bravery"),
      1
    )
  )
}