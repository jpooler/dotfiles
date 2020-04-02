require 'octokit'

access_token = ENV['ACCESS_TOKEN']
client = Octokit::Client.new(:access_token => "#{access_token}")
client.default_media_type = "application/vnd.github.luke-cage-preview+json"
client.auto_paginate = true
team_id = '2393903'  
github_org = "CloudHealth"

def repos_from_contributions(client, github_org, team_id)
  team_repos = []
  temp_repos = []
  devops_repos = []
  org_repos = []
  teammates = []
  org_repos << client.organization_repositories("#{github_org}",sort: 'full_name', :accept => 'application/vnd.github.luke-cage-preview+json')

  temp_repos << client.team_repos("#{team_id}",sort: 'full_name',:accept => 'application/vnd.github.luke-cage-preview+json')
  temp_repos.each do |temp|
    temp.each do |final|
      team_repos << final.name
      p team_repos
    end
  end
  team_members = client.team_members("#{team_id}")
  team_members.each do |team|
    teammates << team.login
  end
  org_repos.each do |repo|
    repo.each do  |t|
      contributors = client.contribs("#{github_org}/#{t.name}")
      contributors.each do |c|
        if teammates.include? "#{c.login}" and !devops_repos.include? "#{t.name}"
          devops_repos << t.name 
        end
      end
    end
  end
  final_repos = devops_repos - team_repos
  puts "Final Repos"
  p final_repos

end


#teams = client.org_teams('CloudHealth',sort: 'full_name', :accept => 'application/vnd.github.luke-cage-preview+json')
#teams.each do |team|
#  puts team.name
#  puts team.id
#end
# DevOps TeamID is 2393903, obtained from org_teams

repos_from_contributions(client, github_org, team_id)

