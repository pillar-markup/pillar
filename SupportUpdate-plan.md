# Updating the support files of an installed book: `_custom` and `pillar updateArchetype`

Plan agreed with Stef on 2026-11-18 (grill session, task 3 of the release tasks).

## Rule for every step

Everything ends up in this repository (`archetypes/…`, `doc/`, the Pillar packages).
The book TemplateExperiments is only used for real dry-runs before a change is put here:
a step is not done until its result is in this repository.

## Problem

`_support` mixes the files of Pillar (templates, `book.css`, fonts, `sbabook.cls`, Beamer styles) with the changes
authors make to them. Today `pillar updateTemplate <archetype>` (`PRProject>>installTemplateNamed:`) deletes the whole
`_support` and copies the archetype again: every change is lost. `_support/archetypeID` only records the archetype name.

## Decisions

1. **`_support` belongs to Pillar**; an update may replace it completely. The changes of a book live in `_custom/`,
   with the same layout as `_support`. `_custom` has a README explaining the mechanism.
2. **Two ways to customize:**
   - whole-file override: a file of `_custom` with the same path as a file of `_support` replaces it at build time
     (templates, LaTeX class…);
   - additions: `_custom/html/css/custom.css` is loaded after `book.css` (Pillar gives the templates a `customCss`
     value when it exists), and `_custom/latex/custom.tex` is read at the end of the LaTeX preamble
     (`\InputIfFileExists`, also in the Beamer templates). The README recommends additions over copying `book.css`.
3. **Applied in one place, the build copy:** `PRWritingTarget>>prepareForExecutionOn:` copies `_support`, then `_custom`
   (except `README.md`) over it, into `_result/<output>/_support`; `PRAbstractOutputDocument>>templateDirectory` reads
   the templates from that merged copy. All paths in templates, CSS and LaTeX keep saying `_support/…`.
4. **`pillar updateArchetype [name]`** replaces `pillar updateTemplate` (removed, no alias; `PRUpdateTemplateCommandLineHandler`
   removed too). The name defaults to `_support/archetypeID` (another name switches the archetype). It never touches
   `_custom`, creates it when missing, and prints what it did (archetype, files added, changed, removed).
5. **Migration of hand-edited books:** before replacing, the old `_support` is moved to `_support-previous/` (ignored
   by the build, overwritten by the next update) and the files that differ from the new version are listed, so the
   author moves real changes into `_custom`.
6. **Where `_custom` comes from:** each archetype gets a `custom/` folder (next to `sample/` and `support/`) with
   `README.md` and a commented example `html/css/custom.css`. `pillar archetype <name>` installs it as `_custom/`;
   `updateArchetype` installs it only when `_custom` is missing, never overwriting it.
7. **Documentation is a main deliverable:** the Pillar commands and the `_custom` mechanism are explained in `doc/`.

## Steps (one tested step at a time)

1. **Merge at build.** `_custom` copied over `_support` in the output; templates read from the merged copy.
   Tests: an override in `_custom` wins; `README.md` is not copied; a book without `_custom` builds as before.
2. **Additions.** `customCss` value; `main.mustache` and `site.mustache` link `custom.css` after `book.css`; LaTeX and
   Beamer templates read `custom.tex`. Dry-run in TemplateExperiments, then into every archetype of this repository.
3. **`pillar updateArchetype [name]`** as in decisions 4 and 5; remove `updateTemplate` and its old handler. Tests on a
   temporary book: default name, `_custom` kept, `_custom` created when missing, `_support-previous` and the list of
   differing files.
4. **`pillar archetype`** installs `custom/` as `_custom/`.
5. **`custom/` folder in every archetype of this repository:** `README.md` and the example `custom.css`
   (dry-run in TemplateExperiments first).
6. **Integration tests** (`PRIntegrationTest`): a book with a template override and a `custom.css` builds as a site
   and as LaTeX; `updateArchetype` keeps `_custom` and produces `_support-previous`.
7. **Documentation in `doc/`** (with task 6, the architecture documentation):
   - every Pillar command with its options and an example: `archetype`, `build` (`html`, `site`, `pdf`, file
     arguments, flags), `updateArchetype`, `serve`, `checkers`, `bookTester`, `updateBuild` (archetype development);
   - the layout of a book (`pillar.conf`, `index.md`, chapters, `_support`, `_custom`, `_result`);
   - the `_custom` mechanism: overrides, `custom.css`, `custom.tex`, what an update does, how to migrate a
     hand-edited `_support` with `_support-previous`;
   - the `custom/README.md` of the archetypes points to it.
