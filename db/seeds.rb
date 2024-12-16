BLOG_SEED = 10
SKILL_SEED = 5
PORTFOLIO_SEED = 9
TOPIC_SEED = 3
TECHNOLOGY_SEED = 3

TOPIC_SEED.times do |itTopic|
    Topic.create!(title:  "Topic #{itTopic}")
end

puts "#{TOPIC_SEED} topics created"

BLOG_SEED.times do |itBlog|
    Blog.create!(
        title: "My blog #{itBlog}",
        body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores quod, sint ratione ex repellat tempora excepturi nesciunt iure ducimus, explicabo pariatur dolorem nemo animi officia at porro? Porro, excepturi ipsa!",
        topic_id: Topic.last.id
    )
end

puts "#{BLOG_SEED} blogs created"

SKILL_SEED.times do |itSkill|
    Skill.create!(
        title: "Rails #{itSkill}",
        percent_used: 16
    )
end

puts "#{SKILL_SEED} skills created"

(PORTFOLIO_SEED - 1).times do |itPortfolio|
    Portfolio.create!(
        title:"Portfolio title #{itPortfolio}",
        subtitle: "Ruby on Rails",
        body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores quod, sint ratione ex repellat tempora excepturi nesciunt iure ducimus, explicabo pariatur dolorem nemo animi officia at porro? Porro, excepturi ipsa!",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200",
    )
end

Portfolio.create!(
        title:"Portfolio title 8",
        subtitle: "Angular",
        body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores quod, sint ratione ex repellat tempora excepturi nesciunt iure ducimus, explicabo pariatur dolorem nemo animi officia at porro? Porro, excepturi ipsa!",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200",
    )


puts "#{PORTFOLIO_SEED} portfolio items created"


TECHNOLOGY_SEED.times do |itTechnology|
  Portfolio.last.technologies.create!(
    name: "Tech Name #{itTechnology}",
    portfolio_id: Portfolio.last.id
  )
end

puts "#{TECHNOLOGY_SEED} technology items created"
