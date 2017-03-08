# Development Cycle

## Test and Behavior Driven Development

Tests are necessary unless proven to be difficult due to platform restrictions or immaturity and/or restrictions imposed by the platform's testing frameworks

## Branching

This project follows [Git Flow](http://nvie.com/posts/a-successful-git-branching-model/).

_Feature_ branches should be prefixed with `feature/`.

_Task_ branches should be prefixed with `tech/`.

_Hot Fix_ branches should be prefixed with `defect/`.

An example of the name for a feature branch would be `feature/LMA-001`, where `LMA-001` is the card number assigned by JIRA.

## Committing

Commits should be atomic.

Messages should start with a verb in present tense.

Titles should be short and to the point.

If necessary, a description may be added after an empty line below the title.

- [5 Useful Tips For A Better Commit Message]( https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message)

## Pull Request

It is the reviewer's responsible to ensure

- __the build succeeds__,
- __the tests pass__, 
- __Syntax adheres to [the project standard](Documents/coding-style-guideline.md)__, and 
- __design conforms to [_SOLID_ principles](https://en.wikipedia.org/wiki/SOLID)__.

Once you are happy with the pull request, ___merge___ it.

Ensure that the remote branch is closed as well.

### Helper Scripts

you can use `git worktree` to checkout the branch to be reviewed in a new directory. `start_pr` and `end_pr` aliases help you to do so.

Add the `start_pr` and `end_pr` handles to your bash profile as described [here](https://github.com/hadibadjian/dotfiles/blob/master/.aliases#L148).

Change the [`base_path`](https://github.com/hadibadjian/dotfiles/blob/master/.aliases#L149) to where you want the PR folders checked out.

Start the pull request review by `start_pr <branch_name>`. This command will take you to the directory the PR is checked out.

Once you are done reviewing the code base (executing tests, monitor warnings and confirming successful builds), end the review by executing `end_pr`. This command takes you back to the working directory prior to starting the code review.
