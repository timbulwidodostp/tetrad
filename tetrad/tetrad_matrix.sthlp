{smcl}
{* 5/6/14}{...}
{title:Title}

{p2colset 8 18 24 2}{...}
{p2col:{cmd:tetrad_matrix}} Conduct Confirmatory Tetrad Analysis.{p_end}
{p2colreset}{...}

{marker syn}
{title:Syntax}

{p 8 18 2}
{cmd:tetrad_matrix} {cmd:,} {cmd: obs(#)} {cmd: scm}({it:matname}) {cmd: icm1}({it:matname}) [ {it:options} ]
{p_end}


{p 4 4 2}
{cmd: obs(#)} refers to the number of observations for the analysis.
{cmd: scm}({it:matname}) refers to the name of a sample covariance matrix.
{cmd: icm1}({it:matname}) refers to the name of an implied covariance matrix.  

{synoptset 20 tabbed}{...}
{synoptline} 
{synopthdr}
{synoptline} 

{syntab:Dichotomous, Ordinal, and Censored Outcomes} 
{synopt:{cmd:pcacm}({it:matname})} Name of an asymptotic covariance matrix for the polychoric correlation matrix {p_end} 

{syntab:Nested Test} 
{synopt:{cmd:icm2}({it:matname})} Name of an implied covariance matrix nested in first implied covariance matrix {p_end} 

{syntab:Replications} 
{synopt:{cmd:reps(#)}} Number of replications {p_end} 
{synopt:{cmd:seed}({it:string})} Random number seed {p_end} 

{syntab:Reporting} 
{synopt:{cmd:tlist}({it:1 = yes})} Report list of model-implied tetrads {p_end} 

{synoptline} 

{marker des}
{title:Description}

{pstd}
{cmd:tetrad_matrix} conducts Confirmatory Tetrad Analysis (CTA) for a given structural equation model based on a sample size and sample covariance matrix provided by the user. Nested CTA can be performed for two structural equation models with the second model tetrad-nested in the first. {p_end}



{marker opt}
{title:Options}

{marker DOC}
{dlgtab:Dichotomous, Ordinal, and Censored Outcomes}


{p 4 8 2}
{cmd:pcacm}({it:matname}) may be used to specify an asymptotic covariance matrix for a polychoric correlation matrix to obtain CTA for SEMs involving dichotomous, ordinal, and/or censored outcomes.
{p_end}


{marker Nested}
{dlgtab:Nested Test}

{p 4 4 2}
{cmd:icm2}({it:matname}) may be used to specify a tetrad-nested model implied covariance matrix to obtain a nested CTA.
{p_end}

{marker Replications}
{dlgtab:Replications}

{p 4 8 2}
{cmd:reps(#)} may be specified to request # replications of randomly selecting a set of non-redundant vanishing tetrads. The default is 1 replication.

{p 4 8 2}
{cmd:seed}({it:string}) may be used to specify a random number seed.


{marker Reporting}
{dlgtab:Reporting}

{p 4 8 2}
{cmd:tlist}({it:1 = yes}) may be specified to report a list of the model-implied tetrads for the first (and second, if specified) model implied covariance matrix and which tetrads are empirically determined to be vanishing tetrads.



{marker exa}
{dlgtab: Exmamples}

{p 4 8 2}
Below is a basic example of {cmd: tetrad_matrix} based on a single factor measurement model with four indicators.

	{com}. use http://www.stata-press.com/data/r14/sem_1fmm
	{txt}(single-factor measurement model)


{p 4 8 2}
Store sample covariance matrix and implied covariance matrix.
	
	{com}. {res}qui cor {txt}x1 x2 x3 x4, cov
	{com}. {res} local {txt}N = r(N)
	{com}. {res}mat {txt}cov = r(C)
	{com}. {res}qui sem {txt}(x1 x2 x3 x4 <- X)
	{com}. {res}qui estat {txt}framework, fitted
	{com}. {res}mat {txt}sigma1 = r(Sigma)

{p 4 8 2}
Conduct CTA with 5 replications and list model-implied tetrads.

	{com}. {res}tetrad_matrix {txt}, obs(`N') scm(cov) icm1(sigma1) reps(5) tlist(1)

	Model-Implied Tetrads
	tetrad   residual   AVar       t-value    vanish
	--------------------------------------------------
 	1234    0.000000   0.000559    0.0000    1
 	1342   -0.000000   0.000559   -0.0000    1
 	1423    0.000000   0.000496    0.0000    1
	--------------------------------------------------


	Confirmatory Tetrad Analysis Results
    	           Model 1
	rep      Chi-sq     df  p-val
	------------------------------
	  1       1.4240     2  0.4907
	  2       1.4240     2  0.4907
	  3       1.4240     2  0.4907
	  4       1.4240     2  0.4907
 	  5       1.4240     2  0.4907
	------------------------------

{marker aut}
{title:Author}

{p 4 4 2}
Shawn Bauldry, University of Alabama-Birmingham, sbauldry@uab.edu


