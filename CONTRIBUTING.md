# Contributing to CTX OS Core

Thank you for your interest in contributing to CTX OS Core!

## Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/ctxos/ctxos-core.git
   cd ctxos-core
   ```

2. Install dependencies:
   ```bash
   sudo apt-get install -y build-essential debhelper devscripts dpkg-dev pandoc shellcheck
   ```

3. Install BATS for testing:
   ```bash
   git clone https://github.com/bats-core/bats-core.git /tmp/bats-core
   export PATH="/tmp/bats-core/bin:$PATH"
   ```

## Building

```bash
make clean && make all
sudo make install
```

## Testing

Run the BATS test suite:
```bash
export PATH="/tmp/bats-core/bin:$PATH"
bats tests/
```

## Code Style

- Use `#!/bin/bash` shebang
- Use `set -euo pipefail` for error handling
- Run ShellCheck on all scripts: `shellcheck bin/*`
- Follow existing code conventions in the project

## Submitting Changes

1. Create a feature branch
2. Make your changes
3. Run tests and ShellCheck
4. Submit a pull request

## License

This project is licensed under the MIT License.
