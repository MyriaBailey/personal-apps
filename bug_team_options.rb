# options = [
#   { name: "beedrill", type: "poison", bug: "bee", role: "flier" }
#   { name: "paras", type: "grass", role: "mascot"}
#   { name: }
# ]

def screenwipe
  system 'clear'
end

def linebreak
  puts "--------------------------------------"
end

def list_options(options)
  puts options.map(&:first).join(', ')
end

def bullet_list(mons)
  mons.each do |mon|
    puts "- #{mon[0]} (#{mon[1]})"
  end
end

def available_role(options, role)
  mons = options.select { |mon| mon.include?(role) }
  unless mons.empty?
    puts "#{role.capitalize}s:"
    bullet_list(mons)
  end
end

def all_but_those(options)
  mons = options.reject do |mon|
    %w[flier swimmer mascot].any?(mon[2])
  end

  unless mons.empty?
    puts "Remaining:"
    bullet_list(mons)
  end
end

def list_everything(options)
  available_role(options, "swimmer")
  available_role(options, "flier")
  available_role(options, "mascot")
  all_but_those(options)
end


def pick_mon(options)
  if options.empty?
    puts "No pokemon left!"
  else
    puts "Pick a pokemon:"
    # bullet_list(options)
    list_everything(options)

    answer = gets.chomp
    options.assoc(answer)
  end
end

def add_mon!(team, options, choice)
  team << choice
  case choice[0]
  when "ninjask"
    team << options.delete(options.assoc("shedinja"))
    options.delete(options.assoc("nincada"))
  when "shedinja"
    team << options.delete(options.assoc("shedinja"))
    options.delete(options.assoc("nincada"))
  when "nincada"
    options.delete(options.assoc("shedinja"))
    options.delete(options.assoc("ninjask"))
  end
end

def exclude_mons!(options, choice)
  options.reject! do |mon|
    mon.include?(choice[1]) || mon.include?(choice.last)
  end
end



old_list = [
  %w[beedrill poison flier bee],
  %w[paras grass mascot nymph],
  %w[venonat poison mascot gnat],
  %w[venomoth poison team moth],
  %w[ariados poison team spider],
  %w[nincada ground mascot nymph],
  %w[ninjask flying team beetle],
  %w[shedinja ghost team beetle],
  %w[mothim flying team moth],
  %w[vespiquen flying flier bee],
  %w[skorupi poison mascot scorpion],
  %w[yanmega flying flier dragonfly],
  %w[scolipede poison team pede],
  %w[durant steel team ant],
  %w[vikavolt electric flier beetle],
  %w[araquanid water swimmer spider],
  %w[golisopod water swimmer isopod],
  %w[centiscorch fire team pede]
]

list = [
  %w[beedrill poison flier bee],
  %w[paras grass mascot],
  %w[venonat poison mascot],
  # %w[venomoth poison moth],
  %w[ariados poison spider],
  %w[nincada ground mascot],
  %w[ninjask flying beetle],
  %w[shedinja ghost beetle],
  # %w[mothim flying moth],
  %w[vespiquen flying flier bee],
  %w[skorupi poison mascot],
  %w[yanmega flying flier dragonfly],
  %w[scolipede poison pede],
  # %w[durant steel ant],
  %w[vikavolt electric flier beetle],
  %w[araquanid water swimmer spider],
  %w[golisopod water swimmer pede],
  %w[centiskorch fire pede]
]

list.sort_by! { |mon| mon.last }

team = []


until list.empty? do
  screenwipe
  puts "Current team:"
  bullet_list(team)
  linebreak

  linebreak
  mon = pick_mon(list)
  add_mon!(team, list, mon)

  exclude_mons!(list, mon)
end