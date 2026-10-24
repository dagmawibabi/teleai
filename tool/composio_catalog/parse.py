import re, json, sys, glob, os
d = sys.argv[1]
out = {}
for f in glob.glob(os.path.join(d, 'tk_*.md')):
    tk = os.path.basename(f)[3:-3]
    text = open(f, encoding='utf-8').read()
    if '## Tools' not in text: continue
    body = text.split('## Tools', 1)[1]
    tools = {}
    for sec in re.split(r'\n### ', body)[1:]:
        title = sec.split('\n', 1)[0].strip()
        m = re.search(r'\*\*Slug:\*\* `([A-Z0-9_]+)`', sec)
        if not m: continue
        slug = m.group(1)
        after = sec[m.end():]
        desc = after.split('#### Input Parameters')[0].strip()
        params = []
        if '#### Input Parameters' in after:
            tbl = after.split('#### Input Parameters', 1)[1].split('#### Output')[0]
            for line in tbl.splitlines():
                mm = re.match(r'\|\s*`([^`]+)`\s*\|\s*([^|]+?)\s*\|\s*(Yes|No)\s*\|\s*(.*)\|\s*$', line)
                if mm:
                    params.append({'name': mm.group(1), 'type': mm.group(2), 'required': mm.group(3) == 'Yes', 'description': mm.group(4).strip()})
        tools[slug] = {'title': title, 'description': desc, 'params': params}
    out[tk] = tools
json.dump(out, open(os.path.join(d, 'catalog.json'), 'w', encoding='utf-8'), indent=1)
for tk, t in out.items(): print(tk, len(t))
