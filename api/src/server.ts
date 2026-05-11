import Fastify from "fastify";
import { usersRoute } from "./routes/users.route";
import { bettingGroupRoute } from "./routes/betting-group.route";
import { predicationRoute } from "./routes/predication.route";
import { matchRoute } from "./routes/match.route";
import { teamRoute } from "./routes/team.route";

const app = Fastify();

app.get("/", async () => {
    return { message: "API rodando 🚀" };
});

app.register(usersRoute);
app.register(bettingGroupRoute);
app.register(predicationRoute);
app.register(matchRoute);
app.register(teamRoute);

app.listen({ port: 3333, host: "0.0.0.0" }).then(() => {
    console.log("Server running on http://localhost:3333");
});
