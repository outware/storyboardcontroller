# Development Cycle

## Test and Behavior Driven Development

Unit tests are necessary unless proven to be difficult by the platform TDD frameworks immaturity and limitation.

## Branching

### Branching Workflow

This project follows [Git Flow](http://nvie.com/posts/a-successful-git-branching-model/).

_Feature_ branches should match `feature/LMA-000` pattern.

_Task_ branches should match `tech/LMA-000` pattern.

_Hot Fix_ branches should match `defect/LMA-000` pattern.

## Commit

Commits should be atomic. Commit message should start with a verb in present tense. Commit title should be short and to the point. If necessary add commit descriptions after an empty line below the title.

- [5 Useful Tips For A Better Commit Message]( https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message)

## Pull Request

It is the reviewer's responsible to 
- __ensure the build succeeds__,
- __the tests pass__, 
- __syntax is according to [the project standard](CodingStyleGuide.md)__, and 
- __design is conforming to [*SOLID* principles](https://en.wikipedia.org/wiki/SOLID)__.

Once you are happy with the pull request, `Merge` it. Make sure the remote branch is going to be closed as well.

### Helper Scripts

If you do not want to disturb your current working directory, you can use `git worktree` to checkout the reviewing branch in a new directory. `start_pr` and `end_pr` aliases help you to do so.

Add the `start_pr` and `end_pr` handles to your bash profile as described [here](https://github.com/hadibadjian/dotfiles/blob/master/.aliases#L148).

Change the [`base_path`](https://github.com/hadibadjian/dotfiles/blob/master/.aliases#L149) to where you want the PR folders checked out.

Start the pull request review by `start_pr <branch_name>`. This command will take you to the directory the PR is checked out.

Once you are done reviewing the code base (executing tests, monitor warnings and confirming successful builds), end the review by executing `end_pr`. This command will take you back to the directory you used to be before starting the review.
