CREATE TABLE PeopleVehicle (
                               PeopleId INT,
                               VehicleId INT,
                               PRIMARY KEY (PeopleId, VehicleId),
                               FOREIGN KEY (PeopleId) REFERENCES People(id),
                               FOREIGN KEY (VehicleId) REFERENCES Vehicle(id)
);
