#!/usr/bin/env bash
# Based on https://github.com/conda-forge/uv-feedstock/blob/c58acf2e2a37d68057f4e88e145a784f5ee398b6/recipe/build.sh
set -eux

export CARGO_PROFILE_RELEASE_STRIP=symbols

cargo install \
  --no-track \
  --locked \
  --path . \
  --profile release \
  --root "$PREFIX"

cargo-bundle-licenses \
  --format yaml \
  --output "${SRC_DIR}/THIRDPARTY.yml"
