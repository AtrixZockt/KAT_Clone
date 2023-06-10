const fs = require('fs');
const path = require('path');
const markdownIt = require('markdown-it');

// Read comments from .sqf files
const comments = fs.readdirSync('addons').filter(file => file.endsWith('.sqf'));

// Generate documentation from comments
let documentation = '';
comments.forEach(file => {
  const commentsInFile = fs.readFileSync(path.join('addons', file), 'utf-8');
  // Process the comments and generate documentation
  const processedComments = commentsInFile.split('\n').filter(line => line.startsWith('/**'));
  documentation += processedComments.map(comment => {
    // Extract the relevant parts of the comment using a regular expression
    const match = comment.match(/^\s*@(\w+):([^}]+)/);
    if (match) {
      const [, tag, description] = match;
      // Process the tag and description, and generate Markdown documentation
      const markdown = `${tag}: ${description} `;
      return markdown;
    }
  }).join('\n');
});

// Save the generated documentation to a Markdown file
fs.writeFileSync('addons/documentation.md', documentation);
