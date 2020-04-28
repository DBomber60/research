
# input: data frame with quoated and model output
# columns: studies, mu_hat, sigma_hat



v_meta$model = "quoted"

plotdf = rbind(v_meta_output, v_meta[,names(v_meta_output)])

meta = data.frame("mu", mean(sims[,'mu']), sd(sims[,'mu']), 'meta')
names(meta) = names(plotdf)

plotdf = rbind(plotdf, meta)

pd <- position_dodge(0.5) # move them .05 to the left and right
p = ggplot(plotdf, aes(x=studies, y=mu_hat, color = model)) + geom_point() +
  geom_errorbar(aes(ymin=mu_hat - sigma_hat, ymax=mu_hat + sigma_hat), width=.1, position=pd) +
  geom_line() + theme_bw() +
  ylab("Log 10 Virus Copies per mL (g)") +
  xlab("Study") +
  xlab("") +
  ggtitle("Meta Analysis Output - Confidence Intervals")

sims_plot = data.frame(sims)
ggplot(sims_plot, aes(mu)) + geom_density() + xlim(0,10) +
  theme_bw()

sims_plot = data.frame(sims)

p1 = ggplot(sims_plot, aes(mu)) + geom_density() + xlim(0,10) +
  theme_bw() + ggtitle("Posterior mu Density - Log Copies")

ggsave

p2 = ggplot(sims_plot, aes(10^mu)) + geom_density() + xlim(0,1e5) + theme_bw() +
  ggtitle("Posterior Density - Virus Copies")


ggsave("posteriors.pdf", arrangeGrob(p1, p2, nrow = 1))

ggsave("p.png", dpi = 320)
