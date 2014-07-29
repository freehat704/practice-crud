def tagged?(tag)
  Tag.where(tag_name: tag).empty?
end

def tag_array(tag_string)
  tag_string.split(", ")
end

def tag_appender(tags, post)
	tags.each do |tag|
    if tagged?(tag)
      new_tag = Tag.create(tag_name: tag)
    else
      new_tag = Tag.find_by_tag_name(tag).first
    end
    post.tags << new_tag
    post.save
  end
end
