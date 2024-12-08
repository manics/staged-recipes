@REM Based on https://github.com/conda-forge/uv-feedstock/blob/c58acf2e2a37d68057f4e88e145a784f5ee398b6/recipe/bld.bat
@echo on

set CARGO_PROFILE_RELEASE_STRIP=symbols

cd crates\uv

cargo install ^
    --no-track ^
    --locked ^
    --path . ^
    --profile release ^
    --root "%LIBRARY_PREFIX%" ^
    || exit 1


cargo-bundle-licenses ^
    --format yaml ^
    --output "%SRC_DIR%\THIRDPARTY.yml" ^
    || exit 3
