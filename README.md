# clitsrec
A bash script wrapper for interactive commands which records the terminal output (typescript) of each session preserving the entire history. It's useful forcommand-line AI workflow tools like `gemini-cli` to automatically save the history of each each conversation which is otherwise lost when the session ends.

## Installation
```sh
curl https://raw.githubusercontent.com/acerix/clitsrec/refs/heads/main/clitsrec.sh > /usr/local/bin/clitsrec
chmod a+x /usr/local/bin/clitsrec
```

## Usage

Run `gemini`, recording the terminal output for each session to a log file in the users home directory (e.g. ~/.local/share/clitsrec/session-name/script.out).
```sh
clitsrec gemini
```

List the sessions log directories:
```sh
ls -l ~/.local/share/clitsrec
```

Display a session output log as text, with ANSI formatting:
```sh
less -R script.out
```

Replay a session in the terminal:
```sh
scriptreplay script.tm script.out
```

