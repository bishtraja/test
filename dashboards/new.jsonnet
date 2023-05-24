local dashboard = {
  annotations: {
    list: [
      {
        builtIn: 1,
        datasource: {
          type: "grafana",
          uid: "-- Grafana --",
        },
        enable: true,
        hide: true,
        iconColor: "rgba(0, 211, 255, 1)",
        name: "Annotations & Alerts",
        type: "dashboard",
      },
    ],
  },
  editable: true,
  fiscalYearStartMonth: 0,
  graphTooltip: 0,
  id: 2,
  links: [],
  liveNow: false,
  panels: [
    {
      datasource: {
        type: "prometheus",
        uid: "5r5SMBfVk",
      },
      fieldConfig: {
        defaults: {
          color: {
            mode: "palette-classic",
          },
          mappings: [
            {
              options: {
                from: 0,
                result: {
                  color: "dark-red",
                  index: 0,
                },
                to: 80,
              },
              type: "range",
            },
            {
              options: {
                from: 80,
                result: {
                  color: "dark-orange",
                  index: 1,
                },
                to: 95,
              },
              type: "range",
            },
            {
              options: {
                from: 95,
                result: {
                  color: "dark-green",
                  index: 2,
                },
                to: 100,
              },
              type: "range",
            },
          ],
          thresholds: {
            mode: "percentage",
            steps: [
              {
                color: "dark-green",
                value: null,
              },
              {
                color: "dark-orange",
                value: 80,
              },
            ],
          },
        },
        overrides: [],
      },
      gridPos: {
        h: 6,
        w: 6,
        x: 0,
        y: 0,
      },
      id: 3,
      options: {
        orientation: "vertical",
        reduceOptions: {
          calcs: ["lastNotNull"],
          fields: "",
          values: false,
        },
        showThresholdLabels: false,
        showThresholdMarkers: false,
      },
      pluginVersion: "9.5.1",
      targets: [
        {
          datasource: {
            type: "prometheus",
            uid: "5r5SMBfVk",
          },
          editorMode: "code",
          expr: "100 * sum_over_time(probe_success{instance=~\"http://192.168.18.95:80\"}[$__range]) / count_over_time(scrape_duration_seconds[$__range])",
          legendFormat: "__auto",
          range: true,
          refId: "A",
        },
      ],
      title: "jenkins",
      type: "gauge",
    },
  ],
  refresh: "",
  schemaVersion: 38,
  style: "dark",
  tags: [],
  templating: {
    list: [],
  },
  time: {
    from: "now-1h",
    to: "now",
  },
  timepicker: {},
  timezone: "",
  title:"jenkins_dashboard",
  uid: "xyxyyza",
  version: 2,
  weekStart: "",
};

dashboard
