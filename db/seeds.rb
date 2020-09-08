def find_proc(sub_doc)
  sub = sub_doc.xpath('.//ul/li')
  title =
    if sub.size.positive?
      sub.each do |sub_sub_doc|
        find_proc(sub_sub_doc)
      end

      sub_doc.xpath('./a').text.strip
    else
      sub_doc.text.strip
    end

  Procedure.where(title: title).first_or_create unless title.blank?
end

doc = Nokogiri::HTML(URI.open('https://en.wikipedia.org/wiki/Medical_procedure'))

doc.xpath('//*[@id="List_of_medical_procedures"][1]/parent::h2/following-sibling::ul/li').each do |p|
  find_proc(p)
end
