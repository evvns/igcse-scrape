// GNAA 2023
const https = require('https');
const fs = require('fs');
const path = require('path');


const baseUrl = 'https://qualifications.pearson.com/content/dam/pdf/International%20GCSE/';


function downloadFile(url, filename) {
  https.get(url, (res) => {
    res.pipe(fs.createWriteStream(filename));
  });
}


function downloadPastPapers() {
 
  const subjects = ['biology', 'chemistry', 'physics', 'mathematics-a', 'mathematics-b'];
  const years = ['2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021'];

  
  subjects.forEach((subject) => {
    years.forEach((year) => {
      const filename = `IGCSE_${subject}_${year}.pdf`;
      const url = `${baseUrl}${subject}/${year}/${filename}`;
      https.get(url, (res) => {
        if (res.statusCode === 200) {
          console.log(`Downloading ${filename}...`);
          downloadFile(url, filename);
        }
      });
    });
  });
}


downloadPastPapers();
