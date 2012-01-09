require 'rss/maker'

def visits_to_atom (src, visits)
  version = "2.0"
  content = RSS::Maker.make(version) do |m|
    m.channel.id = "tag:springsource.com"
    m.channel.title = "Pet Clinic Visits"
    m.channel.link = src
    m.channel.description = "RSS feed of pet clinic visits"
    m.items.do_sort = true # sort items by date

    visits.each do |visit|
      item = m.items.new_item
      item.id = "tag:springsource.com,#{visit.date}:#{visit.id}"
      item.title = "#{visit.pet.name} visit on #{visit.date}"
      item.updated = visit.date
      item.content = visit.description
    end
  end
  return content
end