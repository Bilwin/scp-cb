if CLIENT then

    hook.Add("SetupWorldFog", "SCP.CB.Fog", function()
        render.FogMode( 1 ) 
        render.FogStart( 500 )
        render.FogEnd( 1200 )
        render.FogMaxDensity( .6 )

        local col = Vector(0.3,0.3,0.3)
        render.FogColor( col.x * 255, col.y * 255, col.z * 255 )

        return true
    end)

    hook.Add("SetupSkyboxFog", "SCP.CB.Fog", function()
        render.FogMode(MATERIAL_FOG_LINEAR)
        render.FogStart( (300-600)/16-(200/16) )
        render.FogEnd( 300/16-(200/16)  )
        render.FogMaxDensity( 1 )

        local col = Vector(0.3,0.3,0.3)
        render.FogColor( col.x * 255, col.y * 255, col.z * 255 )

        return true
    end)
end

if SERVER then
    local cb_entFog = false

    hook.Add("Initialize", "SCP.CB.FogZ", function()
        for k, v in ipairs( ents.GetAll( ) ) do
            if v:GetClass( ) == "env_fog_controller" then
                v:SetKeyValue("fogend",2000)
                v:SetKeyValue("fogstart",500)
                v:SetKeyValue("farz",7000)
                cb_entFog = v
                break
            end
        end

        if not cb_entFog then
            v = ents.Create( "env_fog_controller" )
                v:SetKeyValue("fogend",2000)
                v:SetKeyValue("fogstart",500)
                v:SetKeyValue("farz",7000)
            v:Spawn( )

            cb_entFog = v
        end
    end)
end