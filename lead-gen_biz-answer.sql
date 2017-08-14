select monthname(charged_datetime) as month, sum(amount) as revenue from billing where monthname(charged_datetime) = 'March' AND year(charged_datetime) = '2012'
group by month;

select clients.client_id, sum(billing.amount) as revenue from billing
join clients on billing.client_id = clients.client_id
where clients.client_id = 2;

select domain_name, client_id from sites
where client_id = 10;

select client_id, monthname(created_datetime) as month, year(created_datetime) as year from sites
where client_id = 1;

select client_id, monthname(created_datetime) as month, year(created_datetime) as year from sites
where client_id = 20;

select sites.domain_name as website, count(leads.leads_id) as numb_of_leads, leads.registered_datetime from leads
join sites on leads.site_id = sites.site_id
where leads.registered_datetime between '2011-01-01' and '2011-02-15'
group by sites.domain_name;

select concat_ws(" ",clients.first_name, clients.last_name) as name, count(leads.leads_id) as numb_of_leads from leads
join sites on leads.site_id = sites.site_id
join clients on sites.client_id = clients.client_id
where registered_datetime between '2011-01-01' and '2011-12-31'
group by name;

select concat_ws(" ",clients.first_name, clients.last_name) as name, count(leads.leads_id) as numb_of_leads, monthname(leads.registered_datetime) as month from leads
join sites on leads.site_id = sites.site_id
join clients on sites.client_id = clients.client_id
where leads.registered_datetime between '2011-01-01' and '2011-06-30'
group by name, month;

select concat_ws(" ",clients.first_name, clients.last_name) as name, sites.domain_name, count(leads.leads_id) as numb_of_leads, DATE_FORMAT(leads.registered_datetime, '%M %d, %Y') as date_generated from leads
join sites on leads.site_id = sites.site_id
join clients on sites.client_id = clients.client_id
where leads.registered_datetime between '2011-01-01' and '2011-12-31'
group by sites.domain_name;

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, sites.domain_name, COUNT(leads.leads_id) AS num_leads
FROM clients
	left JOIN sites ON clients.client_id = sites.client_id
    LEFT JOIN leads ON sites.site_id = leads.site_id
GROUP BY clients.client_id, sites.domain_name;

select concat_ws(" ",clients.first_name, clients.last_name) as name, sum(billing.amount) as revenue, monthname(billing.charged_datetime) as month, year(billing.charged_datetime) as year from billing
join clients on billing.client_id = clients.client_id
group by name, month, year;

select concat_ws(" ",clients.first_name, clients.last_name) as name, group_concat(" / ", sites.domain_name) from clients
left join sites on clients.client_id = sites.client_id
group by clients.client_id;










