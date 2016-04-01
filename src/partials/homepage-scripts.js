// Fetch my starred repos
function getRepos() {
  const url = 'https://api.github.com/users/michaelrambeau/starred';
  return fetch(url)
    .then(r => r.json())
}

// Render starred repos in the page
function renderRepos(repos) {
  var tempFn = doT.template(getTemplate());
  var resultText = tempFn({foo: 'with doT', repos: repos});
  document.getElementById('repos').innerHTML = resultText;
}

// return the template that will be passed to the template engine
function getTemplate() {
  var template = `
    <table>
    {{~it.repos: repo}}
        <tr class="github-project">
          <td>
            <a href={{!getProjectURL(repo)}}>{{!repo.name}}</a>
            <span class="count">
              <i class="fa fa-star"></i>
              {{!repo.stargazers_count}}
            </span>
            <p class="description">
              <i class="fa fa-quote-left"></i>
              {{!getDescription(repo)}}
              <i class="fa fa-quote-right"></i>
            </p>
          </td>
        </tr>
    {{~}}
    </table>
  `;
  return template;
}

// Return project URL
const getProjectURL = (repo) => repo.homepage ? repo.homepage : repo.html_url;

// Return project description, removing emojis
const getDescription = (repo) => repo.description.replace(/\:[a-z_\d]+\:/g, '').trim();

// Fetch and render: START!
getRepos().then(json => renderRepos(json));
