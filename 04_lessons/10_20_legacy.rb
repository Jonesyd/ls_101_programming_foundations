mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

# legacy code

counter = 0


loop do
  break if counter == mailing_campaign_leads.size
  full_name = mailing_campaign_leads[counter][:name]
  names = full_name.split

  names_counter = 0
  loop do
    break if names_counter == names.size
    name = names[names_counter]
    names[names_counter] = name.capitalize

    names_counter += 1
  end

  capitalized_full_name = names.join(' ')
  mailing_campaign_leads[counter][:name] = capitalized_full_name

  counter += 1
end

usable_leads = []
counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end

  counter += 1
end

usable_leads.each {|lead| puts lead }


puts "example one..."

caps = mailing_campaign_leads.map do |lead|
  lead[:name].capitalize!
end

caps.each {|c| puts c}  # doesn't capitalize second name

mailing_campaign_leads.select! do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end

# mutates the original array (that's not great for marketing)
# no.



puts "example two..."

mailing_campaign_leads2 = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]


mailing_campaign_leads2.each do |lead|
  names = lead[:name].split
  names.map! { |name| name.capitalize }
  lead[:name] = names.join(' ')
end

mailing_campaign_leads2.each {|rec| puts rec }
# capitalize yes

usable_leads = mailing_campaign_leads2.keep_if do |lead|
  lead[:days_since_login] <= 60 && lead[:mailing_list]
end

p usable_leads
p mailing_campaign_leads2  # mutates the caller
# no


puts "example three ..."

mailing_campaign_leads3 = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

mailing_campaign_leads3.each do |lead|
  names = lead[:name].split
  lead[:name] = names.map { |name| name.capitalize }.join(' ')
end

mailing_campaign_leads3.each {|rec3| puts rec3}
# indexed assignment does mutate.

usable_leads3 = mailing_campaign_leads3.reject do |lead|
  last_login = lead[:days_since_login]
  subscribed_to_list = lead[:mailing_list]
  last_login > 59 && !subscribed_to_list
end

# not subscribed to list. # and condition ruins this one.
puts "Usable leads are ........."
usable_leads3.each {|three| puts three }


puts "example four ........"

mailing_campaign_leads4 = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

mailing_campaign_leads4.each do |lead|
  names = lead[:name].split
  names.map! { |name| name.capitalize }
  lead[:name] = names.join(' ')
end

# it does work (note: map!)
puts "mailing list ......"
mailing_campaign_leads4.each {|mail4| puts mail4}

usable_leads4 = mailing_campaign_leads4.select do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end

puts "usable leads .... "
usable_leads4.each {|leads4| puts leads4 }
puts "original array ......."
mailing_campaign_leads4.each {|oa| puts oa }
