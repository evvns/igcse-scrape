local https = require('ssl.https')
local lfs = require('lfs')
print("GAY NIGGER ASSOCIATION OF AMERICA")
local baseUrl = 'https://qualifications.pearson.com/content/dam/pdf/International%20GCSE/'
function downloadFile(url, filename)
  local file = io.open(filename, 'wb')
  https.request{
    url = url,
    sink = file,
  }
  file:close()
end


function downloadPastPapers()
  local subjects = {'biology', 'chemistry', 'physics', 'mathematics-a', 'mathematics-b'}
  local years = {'2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021'}
  for _, subject in ipairs(subjects) do
    for _, year in ipairs(years) do
      local filename = 'IGCSE_' .. subject .. '_' .. year .. '.pdf'
      local url = baseUrl .. subject .. '/' .. year .. '/' .. filename
      local body, code, headers = https.request(url)
      if code == 200 then
        print('Downloading ' .. filename .. '...')
        downloadFile(url, filename)
      end
    end
  end
end


downloadPastPapers()
