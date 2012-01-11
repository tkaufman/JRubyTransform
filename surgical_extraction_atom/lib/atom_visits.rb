require 'rss/maker'
java_import org.springframework.web.servlet.ModelAndView
java_import org.springframework.web.servlet.view.AbstractView
java_import javax.servlet.http.HttpServletRequest
java_import javax.servlet.http.HttpServletResponse
java_import java.util.Map

class AtomVisitsView < AbstractView

  def renderMergedOutputModel(model, request, response)
    java.io.PrintWriter writer = response.get_writer
    feed = visits_to_atom("http://localhost:8080", model.get("visits"))
    writer.println(feed)
    writer.close()
  end

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
        item.updated = visit.date.to_s
        item.description = visit.description
      end
    end
    return content.to_s
  end

end

AtomVisitsView.new