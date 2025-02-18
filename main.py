from lxml import etree

# Загрузите XML и XSLT файлы
xml_file = 'files/data.xml'

i = 1

while i < 6:
    xslt_file = f'files/Task-{i}.xsl'
    xml = etree.parse(xml_file)
    xslt = etree.parse(xslt_file)

    transform = etree.XSLT(xslt)
    result = transform(xml)
    with open(f'files/output{i}.xml', 'wb') as f:
        f.write(etree.tostring(result, pretty_print=True))
    i += 1
