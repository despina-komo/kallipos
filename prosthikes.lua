function Image(img)
      if img.classes:find('prosthikes',1) then
        local f = io.open("quotes/" .. img.src, 'r')
        local doc = pandoc.read(f:read('*a'))
        f:close()
        local caption = pandoc.utils.stringify(doc.meta.caption) or "Epigraph has not been set"
        local person = pandoc.utils.stringify(doc.meta.person) or "Person has not been set"
        local prosthikes = "> " .. caption .. " " .. person
        return pandoc.RawInline('markdown',prosthikes)
      end
end
