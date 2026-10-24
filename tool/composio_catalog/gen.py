"""Generates lib/features/telegram/data/telegram_app_catalog.dart from the
Composio toolkit docs (parsed into catalog.json) and curated.py."""
import json, re, sys, importlib.util

S, OUT = sys.argv[1], sys.argv[2]
spec = importlib.util.spec_from_file_location('c', S + '/scripts/curated.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
cat = json.load(open(S + '/composio/catalog.json', encoding='utf-8'))
version = {}
for tk in set(t for t, *_ in m.C):
    txt = open(S + f'/composio/tk_{tk}.md', encoding='utf-8').read()
    mm = re.search(r'\*\*Version:\*\* (\S+)', txt)
    version[tk] = mm.group(1) if mm else '?'

CATEGORY = {
    'gmail': 'gmail', 'outlook': 'outlook', 'googlecalendar': 'calendar',
    'googledrive': 'googleDocs', 'googledocs': 'googleDocs', 'googlesheets': 'googleDocs',
    'slack': 'slack', 'notion': 'notion', 'github': 'githubAccount',
    'linear': 'linear', 'todoist': 'todoist',
}
DROP = re.compile(r'^(user_id|userId|verbose|include_sensitivity_label|pagetoken_dropped|editors_field_removed|'
                  r'email_query_transformed|orderby_size_transformed|bare_text_query_transformed|'
                  r'emailaddress_field_removed|original_.*|cursor_was_corrupted|page_size_was_capped|'
                  r'include_permissions_for_view|includePermissionsForView|include_all_metadata|fields|'
                  r'sharedExtendedProperty|privateExtendedProperty|syncToken|iCalUID|include_labels|includeLabels|'
                  r'auto_paginate|highlight|attachment|image_assets|dry_run)$')
OBJECT_ITEMS = {'content_blocks', 'new_children', 'properties', 'sorts', 'attendees_info', 'items',
                'filter_properties', 'child_blocks'}


def dart(s):
    s = s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$').replace('\n', ' ')
    return "'" + s + "'"


OURS = {slug for _, slug, _, _ in m.C}


def clip(s, n):
    s = re.sub(r'\s+', ' ', s).strip()
    # The model knows these tools by their lower-case names.
    s = re.sub(r'\b[A-Z][A-Z0-9]+(?:_[A-Z0-9]+)+\b', lambda x: x.group(0).lower() if x.group(0) in OURS else x.group(0), s)
    if len(s) <= n:
        return s
    cut = s[:n]
    dot = cut.rfind('. ')
    return (cut[:dot + 1] if dot > n * 0.5 else cut.rstrip() + '…')


def schema(p):
    t = p['type']
    desc = p['description']
    mm = re.match(r'string \("(.*)"\)', t)
    if mm:
        t = 'string'
        desc = f'{desc} Default {mm.group(1)}.'
    out = {'type': t}
    if t == 'array':
        if p['name'] == 'values':
            out['items'] = {'type': 'array', 'items': {'type': 'string'}}
        elif p['name'] in OBJECT_ITEMS:
            out['items'] = {'type': 'object'}
        else:
            out['items'] = {'type': 'string'}
    if desc:
        out['description'] = clip(desc, 300)
    return out


def literal(v, indent):
    pad = ' ' * indent
    if isinstance(v, dict):
        if not v:
            return '{}'
        inner = ',\n'.join(f"{pad}  {dart(k)}: {literal(x, indent + 2)}" for k, x in v.items())
        return '{\n' + inner + f',\n{pad}}}'
    if isinstance(v, list):
        return '[' + ', '.join(literal(x, indent) for x in v) + ']'
    if isinstance(v, bool):
        return 'true' if v else 'false'
    return dart(v)


lines = [
    "part of 'telegram_tools.dart';",
    '',
    '// GENERATED from the Composio toolkit reference (docs.composio.dev/toolkits).',
    '// Toolkit versions: ' + ', '.join(f'{k} {v}' for k, v in sorted(version.items())) + '.',
    '// Regenerate rather than edit by hand; the hand-written app tools live in',
    '// telegram_app_tools.dart.',
    '',
    '/// Composio tool slug and toolkit for each generated app tool.',
    'const appToolSlugs = <String, (String toolkit, String slug)>{',
]
for tk, slug, kind, label in m.C:
    lines.append(f"  {dart(slug.lower())}: ({dart(tk)}, {dart(slug)}),")
lines += ['};', '', 'final _appCatalogTools = <TelegramTool>[']
for tk, slug, kind, label in m.C:
    t = cat[tk][slug]
    params = [p for p in t['params'] if not DROP.match(p['name'])]
    params = [p for p in params if p['type'] != 'object' or p['required']]
    props = {p['name']: schema(p) for p in params}
    req = [p['name'] for p in params if p['required']]
    desc = clip(t['description'], 520)
    if kind == 'w':
        desc += ' Changes something in the user\'s account: only when they asked; they approve first.'
    if kind == 'd':
        desc += ' Destructive: only when the user clearly asked for exactly this; it always waits for approval.'
    params_lit = {'type': 'object', 'properties': props}
    if req:
        params_lit['required'] = req
    lines.append('  TelegramTool(')
    lines.append(f'    name: {dart(slug.lower())},')
    lines.append(f'    label: {dart(label)},')
    lines.append(f'    category: ToolCategory.{CATEGORY[tk]},')
    lines.append('    cost: ToolCost.apps,')
    if kind in 'wd':
        lines.append('    requiresApproval: true,')
    if kind == 'd':
        lines.append('    destructive: true,')
    lines.append(f'    description: {dart(desc)},')
    lines.append(f'    parameters: {literal(params_lit, 4)},')
    lines.append('  ),')
lines += ['];', '']
open(OUT, 'w', encoding='utf-8', newline='\n').write('\n'.join(lines))
print('wrote', len(m.C), 'tools')
