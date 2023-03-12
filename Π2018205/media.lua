function Image (img)
        if img.classes:find( ‘media’, 1) then
          local f = io.open(“P2019223/“ .. img.src, ‘r’)
          local doc = pandoc.read(f: read ( ‘*a’))
          f:close()
          local caption = pandoc.utils.stringify( doc.meta.caption)         
          local student = pandoc.utils.stringify(doc.meta.student)
          local am = pandoc.utils.stringify( doc.meta.am)
          local content = “> “ .. caption .. “ \n>” .. “Φοιτητής:” .. student .. “ \n>” .. “ Αριθμός Μητρώου:” .. am
         return pandoc.RawInLine (‘markdown’, content)
        end
end
