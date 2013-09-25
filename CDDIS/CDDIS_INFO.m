function output = CDDIS_INFO(monu)
%CDDIS_INFO     Determines Where the data file is located.

    [rows,cols] = size(monu);
    
    for k = 1:rows
        if     strcmp(monu(k,:),'novm') == 1
            output(k,:)  = 'Site Location: Novosibirsk, Russia     ';  
        elseif strcmp(monu(k,:),'mdo1') == 1
            output(k,:)  = 'Site Location: Mcdonald, Texas         ';
        elseif strcmp(monu(k,:),'pre1') == 1   
            output(k,:)  = 'Site Location: Pretoria, Africa        ';
        elseif strcmp(monu(k,:),'artu') == 1   
            output(k,:)  = 'Site Location: Artu, Russia            ';
        elseif strcmp(monu(k,:),'bjfs') == 1   
            output(k,:)  = 'Site Location: Beijing, China          ';
        else
            output(k,:)  = 'Site Location: Unknown                 ';
        end
    end

end