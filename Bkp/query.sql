SELECT v.dt_venda_mercadoria dt_venda, c.cd_empresa, c.cd_mercadoria*10+m.nr_dv_mercadoria cd_mercadoria, Sum(qt_vendida) qt_vendida 
FROM prddm.dw_venda_acumulada_mercadoria@rac v, prddm.dc_compra_mercadoria c, prddm.dc_mercadoria m 
WHERE  v.cd_mercadoria = c.cd_mercadoria AND v.cd_empresa = c.cd_empresa and  m.cd_mercadoria = c.cd_mercadoria
AND cd_grupo_fornecedor = 343 AND cd_canal = 0 
GROUP BY dt_venda_mercadoria, c.cd_empresa, c.cd_mercadoria*10+nr_dv_mercadoria
ORDER BY c.cd_empresa, c.cd_mercadoria*10+m.nr_dv_mercadoria, v.dt_venda_mercadoria;
