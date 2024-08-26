BLOG_SEED = 10
SKILL_SEED = 5
PORTFOLIO_SEED= 9

BLOG_SEED.times do |itBlog|
    Blog.create!(
        title: "My blog #{itBlog}",
        body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores quod, sint ratione ex repellat tempora excepturi nesciunt iure ducimus, explicabo pariatur dolorem nemo animi officia at porro? Porro, excepturi ipsa!"
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

PORTFOLIO_SEED.times do |itPortfolio|
    Portfolio.create!(
        title:"Portfolio title #{itPortfolio}",
        subtitle: "Portfolio subtitle #{itPortfolio}",
        body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores quod, sint ratione ex repellat tempora excepturi nesciunt iure ducimus, explicabo pariatur dolorem nemo animi officia at porro? Porro, excepturi ipsa!",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200",
    )
end

puts "#{PORTFOLIO_SEED} portfolio items created"
