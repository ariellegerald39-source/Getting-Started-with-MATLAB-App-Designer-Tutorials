classdef Tutorial3 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        NotActiveLabel             matlab.ui.control.Label
        Lamp                       matlab.ui.control.Lamp
        SensorInputEditField       matlab.ui.control.NumericEditField
        SensorInputEditFieldLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: SensorInputEditField
        function SensorInputEditFieldValueChanged(app, event)

            value = app.SensorInputEditField.Value;

            switch value
                case 0
                    app.Lamp.Color = [0.80 0.80 0.80];
                    app.NotActiveLabel.Text = 'Not Active';

                case 1
                    app.Lamp.Color = [0.29 0.86 0.25];
                    app.NotActiveLabel.Text = 'Active';

                case 2
                    app.Lamp.Color = [1 0 0];
                    app.NotActiveLabel.Text = 'Error!';

                otherwise
                    app.Lamp.Color = [0 0 0];
                    app.NotActiveLabel.Text = 'State Unknown!';
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 463 338];
            app.UIFigure.Name = 'Tutorial3 Sensor App';

            % Create SensorInputEditFieldLabel
            app.SensorInputEditFieldLabel = uilabel(app.UIFigure);
            app.SensorInputEditFieldLabel.HorizontalAlignment = 'right';
            app.SensorInputEditFieldLabel.Position = [131 213 73 22];
            app.SensorInputEditFieldLabel.Text = 'Sensor Input';

            % Create SensorInputEditField
            app.SensorInputEditField = uieditfield(app.UIFigure, 'numeric');
            app.SensorInputEditField.ValueChangedFcn = createCallbackFcn(app, @SensorInputEditFieldValueChanged, true);
            app.SensorInputEditField.Value = 0;
            app.SensorInputEditField.Position = [219 213 100 22];

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Color = [0.80 0.80 0.80];
            app.Lamp.Position = [300 159 20 20];

            % Create NotActiveLabel
            app.NotActiveLabel = uilabel(app.UIFigure);
            app.NotActiveLabel.Position = [131 159 115 22];
            app.NotActiveLabel.Text = 'Not Active';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Tutorial3

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
