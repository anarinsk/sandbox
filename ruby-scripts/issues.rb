require 'octokit'
@address = "cboettig/pdg_control"
  repo = Octokit.issues(@address) # grab the data. Can this go in "initialize?"

  # Generate a list of all open issues, linking to github issue page.  
  out = "<ul>"
  for i in 0 ... repo.size
    lab = ""
    if repo[i].labels[0].class == Hashie::Mash  # Get labels for issues, with color, where applicable 
      lab = " (<font color=\"#" + repo[i].labels[0].color + 
            "\">" + repo[i].labels[0].name  + "</font>)"
    end
    if repo[i].state == "open" # Print only open issues (not necessary? Done by default?)
      out = out + "<li> <a href=\"" + repo[i].html_url + "\">" +  repo[i].title + "</a> " + lab + "</li>"
    end
  end
  out = out + "</ul>"
  out

