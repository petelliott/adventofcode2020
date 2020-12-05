
parse_line <- function(line) {
  entries <- unlist(strsplit(line, " "))
  l <- list()
  for (entry in entries) {
    split <- unlist(strsplit(entry, ":"))
    l[[ split[1] ]] <- split[2]
  }
  return(l)
}

is_hex <- function(i) {
  return((i >= 97 && i <= 102) || (i >= 48 && i <= 57))
}


valid_hex <- function(str) {
  if (substr(str, 1, 1) != "#") {
    return(FALSE)
  }

  ords <- utf8ToInt(str)
  ords <- ords[2:length(ords)]
  if (length(ords) != 6) {
    return(FALSE)
  }

  for(ord in ords) {
    if (!is_hex(ord)) {
      return(FALSE)
    }
  }

  return(TRUE)
}

is_dig <- function(i) {
  return(i >= 48 && i <= 57)
}

is_len_num <- function(str, l) {
  ords <- utf8ToInt(str)
  if (length(ords) != l) {
    return(FALSE)
  }

  for(ord in ords) {
    if (!is_dig(ord)) {
      return(FALSE)
    }
  }

  return(TRUE)
}

valid_passport <- function(passport) {
  if (is.null(passport$byr) || is.null(passport$iyr) || is.null(passport$eyr) || is.null(passport$hgt) ||
      is.null(passport$hcl) || is.null(passport$ecl) || is.null(passport$pid)) {
    return(FALSE)
  }
  if (nchar(passport$byr) != 4 || nchar(passport$iyr) != 4 || nchar(passport$eyr) != 4) {
    return(FALSE)
  }
  byr <- strtoi(passport$byr)
  iyr <- strtoi(passport$iyr)
  eyr <- strtoi(passport$eyr)

  if (is.na(byr) || is.na(iyr) || is.na(eyr)) {
    return(FALSE)
  }
  if (byr < 1920 || byr > 2002 || iyr < 2010 || iyr > 2020 || eyr < 2020 || eyr > 2030) {
    return(FALSE)
  }

  hgtl <- nchar(passport$hgt)
  hgtn <- strtoi(substr(passport$hgt, 1, hgtl-2))
  hgtu <- substr(passport$hgt, hgtl-1, hgtl)

  if (is.na(hgtn)) {
    return(FALSE)
  }

  if ((hgtu == "cm" && (hgtn < 150 || hgtn > 193)) ||
      (hgtu == "in" && (hgtn < 59 || hgtn > 76))) {
    return(FALSE)
  }

 if (!valid_hex(passport$hcl)) {
   return(FALSE)
 }

 if (passport$ecl != "amb" && passport$ecl != "blu" && passport$ecl != "brn" && passport$ecl != "gry" &&
     passport$ecl != "grn" && passport$ecl != "hzl" && passport$ecl != "oth") {
   return(FALSE)
 }

 if (!is_len_num(passport$pid, 9)) {
   return(FALSE)
 }

  return(TRUE)
}


lines <- unlist(readLines("stdin"))
count <- 0
passport <- list()

for (line in lines) {
  if (line == "") {
    if(valid_passport(passport)) {
        count <- count + 1
    }
    passport <- list()
  } else {
    passport <- c(passport, parse_line(line))
  }
}
if(valid_passport(passport)) {
  count <- count + 1
}

print(count)